import 'dart:io';

import 'package:screenscraper/src/apiv2.dart';
import 'package:screenscraper/src/common.dart';
import 'package:screenscraper/src/file_hash.dart';
import 'package:screenscraper/src/game_info.dart';
import 'package:collection/collection.dart';

abstract class ScraperOverrides {
  static List<String> languagePriority = ["en"];
  static List<String> regionPriority = ["wor", "us", "eu", "jp"];
}

class Game {
  final String gameId;
  final String romId;
  final String systemId;
  final String systemName;
  final String name;
  final String description;
  final String developer;
  final String publisher;
  final String players;
  final List<Genre>? genres;
  final String releaseDate;
  final Media media;

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
    required this.genres,
    required this.releaseDate,
    required this.media,
  });
}

class Media {
  final MediaLink? screenshot;
  final MediaLink? titleScreenshot;
  final MediaLink? fanArt;
  final MediaLink? box2d;
  final MediaLink? wheel;
  final MediaLink? video;

  Media({
    required this.screenshot,
    required this.titleScreenshot,
    required this.fanArt,
    required this.box2d,
    required this.wheel,
    required this.video,
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
  final String id;
  final String name;

  Genre({required this.id, required this.name});
}

class RomScraper {
  final ScreenScraperAPIV2 _api;

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

  Future<Game> scrapeRom(String systemId, String romPath) async {
    final file = File(romPath);
    final hash = await calculateFileHash(file);
    if (hash == null) {
      throw Exception("Unable to calculate hash for $romPath");
    }
    final game = await _api.gameInfo(GameInfoRequest.romByHash(
      systemeid: systemId,
      romnom: file.uri.pathSegments.last,
      crc: hash.crc,
      md5: hash.md5,
      sha1: hash.sha1,
    ));
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
      genres: game.genres?.map((e) => Genre(id: e.id, name: _findLanguageText(e.noms))).toList(),
      releaseDate: _findRegionText(game.dates),
      media: Media(
        screenshot: _findMediaLink(game.medias, "ss"),
        titleScreenshot: _findMediaLink(game.medias, "sstitle"),
        fanArt: _findMediaLink(game.medias, "fanart"),
        box2d: _findMediaLink(game.medias, "box-2D"),
        wheel: _findMediaLink(game.medias, "wheel"),
        video: _findMediaLink(game.medias, "video"),
      ),
    );
  }
}

MediaLink? _findMediaLink(List<GameMedia> medias, String type) {
  final media = medias.firstWhereOrNull((element) => element.type == type);
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
