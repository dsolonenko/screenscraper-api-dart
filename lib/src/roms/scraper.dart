import 'dart:io';

import 'package:screenscraper/src/screenscraper/apiv2.dart';
import 'package:screenscraper/src/screenscraper/common.dart';
import 'package:screenscraper/src/screenscraper/game_info.dart';
import 'package:screenscraper/src/roms/file_hash.dart';
import 'package:collection/collection.dart';
import 'package:screenscraper/src/roms/genres.dart';

abstract class ScraperOverrides {
  static List<String> languagePriority = ["en"];
  static List<String> regionPriority = ["wor", "us", "eu", "jp"];
}

/// Game details scraped from ScreenScraper
class Game {
  /// ScreenScraper's id for the game
  final int gameId;

  /// ScreenScraper's id for the rom
  final int? romId;

  /// ScreenScraper's id for the system
  final int systemId;

  /// ScreenScraper's name for the system
  final String systemName;

  /// Game title
  final String name;

  /// Game description
  final String description;

  /// Game developer
  final String developer;

  /// Game publisher
  final String publisher;

  /// Number of players
  final String players;

  /// Game rating 0.0 to 1.0
  final double rating;

  /// Game genres
  final List<Genre>? genres;

  /// Normalized game genre
  final GameGenre? normalizedGenre;

  /// Game release year
  final String releaseYear;

  /// Game media
  final Media media;

  /// Is the game a top staff pick
  final bool isTopStaff;

  /// Is an adult game
  final bool isAdult;

  Game({
    required this.gameId,
    required this.romId,
    required this.systemId,
    required this.systemName,
    required this.name,
    required this.description,
    required this.developer,
    required this.publisher,
    required this.players,
    required this.rating,
    required this.genres,
    required this.normalizedGenre,
    required this.releaseYear,
    required this.media,
    required this.isTopStaff,
    required this.isAdult,
  });

  factory Game.fromGameInfo(
    GameInfo game, {
    List<String>? languagePriority,
    List<String>? regionPriority,
  }) {
    final rating = game.note == null || (game.note!.text?.isEmpty ?? true)
        ? null
        : double.tryParse(game.note!.text!);
    final releaseDate = _findRegionText(
      game.dates,
      regionPriority: regionPriority,
    );
    final genres = game.genres
        ?.map(
          (e) => Genre(
            id: e.id,
            name: _findLanguageText(e.noms, languagePriority: languagePriority),
          ),
        )
        .toList();
    return Game(
      gameId: game.id,
      romId: game.romid,
      systemId: game.systeme.id ?? 0,
      systemName: game.systeme.text ?? "",
      name: _findRegionText(game.noms, regionPriority: regionPriority),
      description: _findLanguageText(
        game.synopsis,
        languagePriority: languagePriority,
      ),
      developer: game.developpeur?.text ?? "",
      publisher: game.editeur?.text ?? "",
      players: game.joueurs?.text ?? "",
      rating: (rating ?? 0.0) / 20.0,
      genres: genres,
      normalizedGenre: _lookupNormalizedGenre(genres),
      releaseYear: releaseDate.length >= 4 ? releaseDate.substring(0, 4) : "",
      media: Media(
        screenshot: _findMediaLink(game.medias, "ss"),
        titleScreenshot: _findMediaLink(game.medias, "sstitle"),
        fanArt: _findMediaLink(game.medias, "fanart"),
        box2d: _findMediaLink(game.medias, "box-2D"),
        box3d: _findMediaLink(game.medias, "box-3D"),
        wheel: _findMediaLink(game.medias, "wheel"),
        video: _findMediaLink(game.medias, "video"),
        videoNormalized: _findMediaLink(game.medias, "video-normalized"),
      ),
      isAdult: _isAdult(genres),
      isTopStaff: game.topstaff ?? false,
    );
  }
}

class Media {
  final MediaLink? screenshot;
  final MediaLink? titleScreenshot;
  final MediaLink? fanArt;
  final MediaLink? box2d;
  final MediaLink? box3d;
  final MediaLink? wheel;
  final MediaLink? video;
  final MediaLink? videoNormalized;

  Media({
    required this.screenshot,
    required this.titleScreenshot,
    required this.fanArt,
    required this.box2d,
    required this.box3d,
    required this.wheel,
    required this.video,
    required this.videoNormalized,
  });
}

class MediaLink {
  final String url;
  final String format;
  final int? size;

  MediaLink({required this.url, required this.format, required this.size});
}

class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});
}

class RomScraper {
  final ScreenScraperAPIV2 _api;
  final List<String> languagePriority;
  final List<String> regionPriority;

  /// Default max file size (in bytes) to calculate whole-file hashes for.
  /// Files larger than this (e.g. optical disc images like PS1/PS2/GameCube/Wii)
  /// will skip full hashing and scrape by filename and size directly.
  static const int defaultMaxHashSizeBytes = 128 * 1024 * 1024; // 128 MB

  final int maxHashSizeBytes;

  RomScraper({
    required String devId,
    required String devPassword,
    required String softwareName,
    required String userName,
    required String userPassword,
    this.maxHashSizeBytes = defaultMaxHashSizeBytes,
    String apiHost = 'api.screenscraper.fr',
    List<String>? languagePriority,
    List<String>? regionPriority,
    bool httpLogging = false,
  }) : languagePriority = languagePriority ?? ScraperOverrides.languagePriority,
       regionPriority = regionPriority ?? ScraperOverrides.regionPriority,
       _api = ScreenScraperAPIV2(
         devId: devId,
         devPassword: devPassword,
         softwareName: softwareName,
         userName: userName,
         userPassword: userPassword,
         apiHost: apiHost,
         httpLog: httpLogging,
       );

  /// Scrape a rom file and return a [Game] object with the matching game details
  /// [systemId] is the ScreenScraper's id of the system the rom belongs to
  Future<Game> scrapeRom({
    required int systemId,
    required String romPath,
    int? maxHashSizeBytes,
  }) async {
    final file = File(romPath);
    if (!file.existsSync()) {
      throw Exception("Unable to find file: $romPath");
    }

    final fileSize = file.lengthSync();
    final maxHash = maxHashSizeBytes ?? this.maxHashSizeBytes;

    FileHash? hash;
    if (fileSize <= maxHash) {
      hash = await calculateFileHash(file);
    }

    final game = await _api.gameInfo(
      GameInfoRequest.rom(
        systemId: systemId,
        romName: file.uri.pathSegments.last,
        crc: hash?.crc,
        md5: hash?.md5,
        sha1: hash?.sha1,
        romSizeBytes: hash?.sizeBytes ?? fileSize,
      ),
    );
    return Game.fromGameInfo(
      game,
      languagePriority: languagePriority,
      regionPriority: regionPriority,
    );
  }

  /// Scrape a game by id and return a [Game] object
  /// [systemId] is the ScreenScraper's id of the system
  /// [gameId] is the ScreenScraper's id of the game
  Future<Game> scrapeGame({required int systemId, required int gameId}) async {
    final game = await _api.gameInfo(
      GameInfoRequest.gameById(systemId: systemId, gameId: gameId),
    );
    return Game.fromGameInfo(
      game,
      languagePriority: languagePriority,
      regionPriority: regionPriority,
    );
  }

  /// Close the scraper to dispose the connection
  void close() {
    _api.close();
  }
}

MediaLink? _findMediaLink(List<GameMedia>? medias, String type) {
  if (medias == null || medias.isEmpty) return null;
  final media = medias.firstWhereOrNull(
    (element) => element.parent == "jeu" && element.type == type,
  );
  if (media == null) return null;
  return MediaLink(url: media.url, format: media.format, size: media.size);
}

String _findRegionText(List<RegionText>? text, {List<String>? regionPriority}) {
  if (text == null || text.isEmpty) return "";
  final priorities = regionPriority ?? ScraperOverrides.regionPriority;
  final item =
      text.firstWhereOrNull((element) => priorities.contains(element.region)) ??
      text.first;
  return item.text ?? "";
}

String _findLanguageText(
  List<LangText>? text, {
  List<String>? languagePriority,
}) {
  if (text == null || text.isEmpty) return "";
  final priorities = languagePriority ?? ScraperOverrides.languagePriority;
  final item =
      text.firstWhereOrNull((element) => priorities.contains(element.langue)) ??
      text.first;
  return item.text ?? "";
}

GameGenre _lookupNormalizedGenre(List<Genre>? genres) {
  if (genres == null) {
    return GameGenre.None;
  }

  // Lookup Sub-genre first
  for (final genre in genres) {
    GameGenre? found = sScreenScraperSubGenresToGameGenres[genre.id];
    if (found != null) {
      return found;
    }
  }

  // Lookup genre except "Action" & "Adult"
  for (final genre in genres) {
    if (genre.id != 10 && genre.id != 413) {
      GameGenre? found = sScreenScraperGenresToGameGenres[genre.id];
      if (found != null) {
        return found;
      }
    }
  }

  // Lookup what's available
  for (final genre in genres) {
    if (genre.id != 413) {
      GameGenre? found = sScreenScraperGenresToGameGenres[genre.id];
      if (found != null) {
        return found;
      }
    }
  }

  return GameGenre.None;
}

bool _isAdult(List<Genre>? genres) {
  if (genres == null) {
    return false;
  }
  return genres.any((element) => element.id == 413);
}
