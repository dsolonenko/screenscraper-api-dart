import 'dart:io';

import 'package:logger/logger.dart';
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
  final int romId;

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

  MediaLink({
    required this.url,
    required this.format,
    required this.size,
  });
}

class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});
}

class RomScraper {
  final ScreenScraperAPIV2 _api;
  final Logger _log = Logger();

  RomScraper({
    required String devId,
    required String devPassword,
    required String softwareName,
    required String userName,
    required String userPassword,
  }) : _api = ScreenScraperAPIV2(
          devId: devId,
          devPassword: devPassword,
          softwareName: softwareName,
          userName: userName,
          userPassword: userPassword,
        );

  /// Scrape a rom file and return a [Game] object with the matching game details
  /// [systemId] is the ScreenScraper's id of the system the rom belongs to
  /// Use [ScraperOverrides] to override the default language and region priority
  Future<Game> scrapeRom(
      {required int systemId, required String romPath}) async {
    final file = File(romPath);
    final hash = await calculateFileHash(file);
    if (hash == null) {
      throw Exception("Unable to calculate hash for $romPath");
    }
    _log.i(
        "Scrapping systemId=$systemId rom=${file.uri.pathSegments.last} crc=${hash.crc} md5=${hash.md5} sha1=${hash.sha1} size=${hash.sizeBytes}");
    final game = await _api.gameInfo(GameInfoRequest.romByHash(
      systemeid: systemId,
      romnom: file.uri.pathSegments.last,
      crc: hash.crc,
      md5: hash.md5,
      sha1: hash.sha1,
      sizeBytes: hash.sizeBytes,
    ));
    _log.i(
        "Game ID for systemId=$systemId rom=${file.uri.pathSegments.last} is ${game.id}");
    final rating =
        game.note.text.isEmpty ? null : double.tryParse(game.note.text);
    final releaseDate = _findRegionText(game.dates);
    final genres = game.genres
        ?.map((e) => Genre(id: e.id, name: _findLanguageText(e.noms)))
        .toList();
    return Game(
      gameId: game.id,
      romId: game.romid,
      systemId: game.systeme.id!,
      systemName: game.systeme.text,
      name: _findRegionText(game.noms),
      description: _findLanguageText(game.synopsis),
      developer: game.developpeur.text,
      publisher: game.editeur.text,
      players: game.joueurs.text,
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

  /// Close the scraper to dispose the connection
  void close() {
    _api.close();
  }
}

MediaLink? _findMediaLink(List<GameMedia> medias, String type) {
  final media = medias.firstWhereOrNull(
      (element) => element.parent == "jeu" && element.type == type);
  if (media == null) return null;
  return MediaLink(
    url: media.url,
    format: media.format,
    size: media.size,
  );
}

String _findRegionText(List<RegionText> text) {
  if (text.isEmpty) return "";
  return text
      .firstWhere(
        (element) => ScraperOverrides.regionPriority.contains(element.region),
        orElse: () => text.first,
      )
      .text;
}

String _findLanguageText(List<LangText> text) {
  if (text.isEmpty) return "";
  return text
      .firstWhere(
        (element) => ScraperOverrides.languagePriority.contains(element.langue),
        orElse: () => text.first,
      )
      .text;
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
