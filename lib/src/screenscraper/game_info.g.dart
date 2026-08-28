// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameInfo _$GameInfoFromJson(Map<String, dynamic> json) => GameInfo(
  id: const IntStringConverter().fromJson(json['id']),
  romid: const IntMaybeEmptyStringConverter().fromJson(json['romid']),
  notgame: const BoolStringConverter().fromJson(json['notgame']),
  noms: (json['noms'] as List<dynamic>?)
      ?.map((e) => RegionText.fromJson(e as Map<String, dynamic>))
      .toList(),
  cloneof: json['cloneof'] as String?,
  systeme: IdText.fromJson(json['systeme'] as Map<String, dynamic>),
  editeur: json['editeur'] == null
      ? null
      : IdText.fromJson(json['editeur'] as Map<String, dynamic>),
  developpeur: json['developpeur'] == null
      ? null
      : IdText.fromJson(json['developpeur'] as Map<String, dynamic>),
  joueurs: json['joueurs'] == null
      ? null
      : IdText.fromJson(json['joueurs'] as Map<String, dynamic>),
  note: json['note'] == null
      ? null
      : IdText.fromJson(json['note'] as Map<String, dynamic>),
  topstaff: const BoolStringConverter().fromJson(json['topstaff']),
  rotation: const BoolStringConverter().fromJson(json['rotation']),
  synopsis: (json['synopsis'] as List<dynamic>?)
      ?.map((e) => LangText.fromJson(e as Map<String, dynamic>))
      .toList(),
  classifications: (json['classifications'] as List<dynamic>?)
      ?.map((e) => TypeText.fromJson(e as Map<String, dynamic>))
      .toList(),
  dates: (json['dates'] as List<dynamic>?)
      ?.map((e) => RegionText.fromJson(e as Map<String, dynamic>))
      .toList(),
  genres: (json['genres'] as List<dynamic>?)
      ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
      .toList(),
  modes: (json['modes'] as List<dynamic>?)
      ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
      .toList(),
  familles: (json['familles'] as List<dynamic>?)
      ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
      .toList(),
  actions: (json['actions'] as List<dynamic>?)
      ?.map((e) => GameAction.fromJson(e as Map<String, dynamic>))
      .toList(),
  medias: (json['medias'] as List<dynamic>?)
      ?.map((e) => GameMedia.fromJson(e as Map<String, dynamic>))
      .toList(),
  roms: (json['roms'] as List<dynamic>?)
      ?.map((e) => GameRom.fromJson(e as Map<String, dynamic>))
      .toList(),
  rom: json['rom'] == null
      ? null
      : GameRom.fromJson(json['rom'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GameInfoToJson(GameInfo instance) => <String, dynamic>{
  'id': const IntStringConverter().toJson(instance.id),
  'romid': const IntMaybeEmptyStringConverter().toJson(instance.romid),
  'notgame': const BoolStringConverter().toJson(instance.notgame),
  'noms': instance.noms,
  'cloneof': instance.cloneof,
  'systeme': instance.systeme,
  'editeur': instance.editeur,
  'developpeur': instance.developpeur,
  'joueurs': instance.joueurs,
  'note': instance.note,
  'topstaff': _$JsonConverterToJson<dynamic, bool>(
    instance.topstaff,
    const BoolStringConverter().toJson,
  ),
  'rotation': _$JsonConverterToJson<dynamic, bool>(
    instance.rotation,
    const BoolStringConverter().toJson,
  ),
  'synopsis': instance.synopsis,
  'classifications': instance.classifications,
  'dates': instance.dates,
  'genres': instance.genres,
  'modes': instance.modes,
  'familles': instance.familles,
  'actions': instance.actions,
  'medias': instance.medias,
  'roms': instance.roms,
  'rom': instance.rom,
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

GameAction _$GameActionFromJson(Map<String, dynamic> json) => GameAction(
  id: json['id'] as String,
  controle: (json['controle'] as List<dynamic>)
      .map((e) => LangText.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GameActionToJson(GameAction instance) =>
    <String, dynamic>{'id': instance.id, 'controle': instance.controle};

GameMedia _$GameMediaFromJson(Map<String, dynamic> json) => GameMedia(
  type: json['type'] as String,
  parent: json['parent'] as String,
  url: json['url'] as String,
  region: json['region'] as String?,
  crc: json['crc'] as String,
  md5: json['md5'] as String,
  sha1: json['sha1'] as String,
  size: const IntStringConverter().fromJson(json['size']),
  format: json['format'] as String,
);

Map<String, dynamic> _$GameMediaToJson(GameMedia instance) => <String, dynamic>{
  'type': instance.type,
  'parent': instance.parent,
  'url': instance.url,
  'region': instance.region,
  'crc': instance.crc,
  'md5': instance.md5,
  'sha1': instance.sha1,
  'size': _$JsonConverterToJson<dynamic, int>(
    instance.size,
    const IntStringConverter().toJson,
  ),
  'format': instance.format,
};

GameRom _$GameRomFromJson(Map<String, dynamic> json) => GameRom(
  id: json['id'] as String,
  romsize: const IntStringConverter().fromJson(json['romsize']),
  romfilename: json['romfilename'] as String,
  romnumsupport: json['romnumsupport'] as String?,
  romtotalsupport: json['romtotalsupport'] as String?,
  romcloneof: json['romcloneof'] as String?,
  romcrc: json['romcrc'] as String?,
  rommd5: json['rommd5'] as String?,
  romsha1: json['romsha1'] as String?,
  beta: const BoolStringConverter().fromJson(json['beta']),
  demo: const BoolStringConverter().fromJson(json['demo']),
  proto: const BoolStringConverter().fromJson(json['proto']),
  trad: const BoolStringConverter().fromJson(json['trad']),
  hack: const BoolStringConverter().fromJson(json['hack']),
  unl: const BoolStringConverter().fromJson(json['unl']),
  alt: const BoolStringConverter().fromJson(json['alt']),
  best: const BoolStringConverter().fromJson(json['best']),
  netplay: const BoolStringConverter().fromJson(json['netplay']),
  regions: (json['regions'] as Map<String, dynamic>?)?.map(
    (k, e) =>
        MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
  ),
);

Map<String, dynamic> _$GameRomToJson(GameRom instance) => <String, dynamic>{
  'id': instance.id,
  'romsize': const IntStringConverter().toJson(instance.romsize),
  'romfilename': instance.romfilename,
  'romnumsupport': instance.romnumsupport,
  'romtotalsupport': instance.romtotalsupport,
  'romcloneof': instance.romcloneof,
  'romcrc': instance.romcrc,
  'rommd5': instance.rommd5,
  'romsha1': instance.romsha1,
  'beta': const BoolStringConverter().toJson(instance.beta),
  'demo': const BoolStringConverter().toJson(instance.demo),
  'proto': const BoolStringConverter().toJson(instance.proto),
  'trad': const BoolStringConverter().toJson(instance.trad),
  'hack': const BoolStringConverter().toJson(instance.hack),
  'unl': const BoolStringConverter().toJson(instance.unl),
  'alt': const BoolStringConverter().toJson(instance.alt),
  'best': const BoolStringConverter().toJson(instance.best),
  'netplay': const BoolStringConverter().toJson(instance.netplay),
  'regions': instance.regions,
};
