// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdText _$IdTextFromJson(Map<String, dynamic> json) => IdText(
  id: const IntStringConverter().fromJson(json['id']),
  text: json['text'] as String?,
);

Map<String, dynamic> _$IdTextToJson(IdText instance) => <String, dynamic>{
  'id': _$JsonConverterToJson<dynamic, int>(
    instance.id,
    const IntStringConverter().toJson,
  ),
  'text': instance.text,
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

RegionText _$RegionTextFromJson(Map<String, dynamic> json) => RegionText(
  region: json['region'] as String?,
  text: json['text'] as String?,
);

Map<String, dynamic> _$RegionTextToJson(RegionText instance) =>
    <String, dynamic>{'region': instance.region, 'text': instance.text};

LangText _$LangTextFromJson(Map<String, dynamic> json) =>
    LangText(langue: json['langue'] as String?, text: json['text'] as String?);

Map<String, dynamic> _$LangTextToJson(LangText instance) => <String, dynamic>{
  'langue': instance.langue,
  'text': instance.text,
};

TypeText _$TypeTextFromJson(Map<String, dynamic> json) =>
    TypeText(type: json['type'] as String?, text: json['text'] as String?);

Map<String, dynamic> _$TypeTextToJson(TypeText instance) => <String, dynamic>{
  'type': instance.type,
  'text': instance.text,
};

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
  header: Header.fromJson(json['header'] as Map<String, dynamic>),
  response: json['response'] as Map<String, dynamic>,
);

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
  'header': instance.header,
  'response': instance.response,
};

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  id: const IntStringConverter().fromJson(json['id']),
  nomcourt: json['nomcourt'] as String?,
  principale: json['principale'] as String?,
  parentid: json['parentid'] as String?,
  noms: (json['noms'] as List<dynamic>?)
      ?.map((e) => LangText.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'id': const IntStringConverter().toJson(instance.id),
  'nomcourt': instance.nomcourt,
  'principale': instance.principale,
  'parentid': instance.parentid,
  'noms': instance.noms,
};

Header _$HeaderFromJson(Map<String, dynamic> json) => Header(
  apiVersion: json['APIversion'] as String?,
  dateTime: json['dateTime'] as String?,
  commandRequested: json['commandRequested'] as String?,
  success: const BoolStringConverter().fromJson(json['success']),
  error: json['error'] as String?,
);

Map<String, dynamic> _$HeaderToJson(Header instance) => <String, dynamic>{
  'APIversion': instance.apiVersion,
  'dateTime': instance.dateTime,
  'commandRequested': instance.commandRequested,
  'success': _$JsonConverterToJson<dynamic, bool>(
    instance.success,
    const BoolStringConverter().toJson,
  ),
  'error': instance.error,
};
