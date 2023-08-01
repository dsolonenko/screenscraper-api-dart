// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
import 'package:screenscraper/src/common.dart';

part 'game_info.g.dart';

@JsonSerializable()
class GameInfo {
  final String id;
  final String romid;
  @BoolStringConverter()
  final bool notgame;
  final List<RegionText> noms;
  final String cloneof;
  final IdText systeme;
  final IdText editeur;
  final IdText developpeur;
  final IdText joueurs;
  final IdText note;
  final String topstaff;
  final String rotation;
  final List<LangText> synopsis;
  final List<TypeText> classifications;
  final List<RegionText> dates;
  final List<Data>? genres;
  final List<Data>? modes;
  final List<Data>? familles;
  final List<GameAction>? actions;
  final List<GameMedia> medias;
  final List<GameRom> roms;
  final GameRom? rom;

  GameInfo({
    required this.id,
    required this.romid,
    required this.notgame,
    required this.noms,
    required this.cloneof,
    required this.systeme,
    required this.editeur,
    required this.developpeur,
    required this.joueurs,
    required this.note,
    required this.topstaff,
    required this.rotation,
    required this.synopsis,
    required this.classifications,
    required this.dates,
    required this.genres,
    required this.modes,
    required this.familles,
    required this.actions,
    required this.medias,
    required this.roms,
    required this.rom,
  });

  factory GameInfo.fromJson(Map<String, dynamic> json) => _$GameInfoFromJson(json);
  Map<String, dynamic> toJson() => _$GameInfoToJson(this);
}

@JsonSerializable()
class GameAction {
  final String id;
  final List<LangText> controle;

  GameAction({
    required this.id,
    required this.controle,
  });

  factory GameAction.fromJson(Map<String, dynamic> json) => _$GameActionFromJson(json);
  Map<String, dynamic> toJson() => _$GameActionToJson(this);
}

@JsonSerializable()
class GameMedia {
  final String type;
  final String parent;
  final String url;
  final String? region;
  final String crc;
  final String md5;
  final String sha1;
  @IntStringConverter()
  final int? size;
  final String format;

  GameMedia({
    required this.type,
    required this.parent,
    required this.url,
    required this.region,
    required this.crc,
    required this.md5,
    required this.sha1,
    required this.size,
    required this.format,
  });

  factory GameMedia.fromJson(Map<String, dynamic> json) => _$GameMediaFromJson(json);
  Map<String, dynamic> toJson() => _$GameMediaToJson(this);
}

@JsonSerializable()
class GameRom {
  final String id;
  @IntStringConverter()
  final int romsize;
  final String romfilename;
  final String romnumsupport;
  final String romtotalsupport;
  final String romcloneof;
  final String romcrc;
  final String rommd5;
  final String romsha1;
  @BoolStringConverter()
  final bool beta;
  @BoolStringConverter()
  final bool demo;
  @BoolStringConverter()
  final bool proto;
  @BoolStringConverter()
  final bool trad;
  @BoolStringConverter()
  final bool hack;
  @BoolStringConverter()
  final bool unl;
  @BoolStringConverter()
  final bool alt;
  @BoolStringConverter()
  final bool best;
  @BoolStringConverter()
  final bool netplay;
  final Map<String, List<String>>? regions;

  GameRom({
    required this.id,
    required this.romsize,
    required this.romfilename,
    required this.romnumsupport,
    required this.romtotalsupport,
    required this.romcloneof,
    required this.romcrc,
    required this.rommd5,
    required this.romsha1,
    required this.beta,
    required this.demo,
    required this.proto,
    required this.trad,
    required this.hack,
    required this.unl,
    required this.alt,
    required this.best,
    required this.netplay,
    required this.regions,
  });

  factory GameRom.fromJson(Map<String, dynamic> json) => _$GameRomFromJson(json);
  Map<String, dynamic> toJson() => _$GameRomToJson(this);
}
