import 'package:json_annotation/json_annotation.dart';

part 'common.g.dart';

@JsonSerializable()
class IdText {
  @IntStringConverter()
  final int? id;
  final String? text;

  IdText({this.id, this.text});

  factory IdText.fromJson(Map<String, dynamic> json) => _$IdTextFromJson(json);
  Map<String, dynamic> toJson() => _$IdTextToJson(this);
}

@JsonSerializable()
class RegionText {
  final String? region;
  final String? text;

  RegionText({this.region, this.text});

  factory RegionText.fromJson(Map<String, dynamic> json) =>
      _$RegionTextFromJson(json);
  Map<String, dynamic> toJson() => _$RegionTextToJson(this);
}

@JsonSerializable()
class LangText {
  final String? langue;
  final String? text;

  LangText({this.langue, this.text});

  factory LangText.fromJson(Map<String, dynamic> json) =>
      _$LangTextFromJson(json);
  Map<String, dynamic> toJson() => _$LangTextToJson(this);
}

@JsonSerializable()
class TypeText {
  final String? type;
  final String? text;

  TypeText({this.type, this.text});

  factory TypeText.fromJson(Map<String, dynamic> json) =>
      _$TypeTextFromJson(json);
  Map<String, dynamic> toJson() => _$TypeTextToJson(this);
}

@JsonSerializable()
class Response {
  final Header header;
  final Map<String, dynamic> response;

  Response({required this.header, required this.response});

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}

@JsonSerializable()
class Data {
  @IntStringConverter()
  final int id;
  final String? nomcourt;
  final String? principale;
  final String? parentid;
  final List<LangText>? noms;

  Data({
    required this.id,
    this.nomcourt,
    this.principale,
    this.parentid,
    this.noms,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Header {
  @JsonKey(name: 'APIversion')
  final String? apiVersion;
  final String? dateTime;
  final String? commandRequested;
  @BoolStringConverter()
  final bool? success;
  final String? error;

  Header({
    this.apiVersion,
    this.dateTime,
    this.commandRequested,
    this.success,
    this.error,
  });

  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);
  Map<String, dynamic> toJson() => _$HeaderToJson(this);
}

class BoolStringConverter implements JsonConverter<bool, dynamic> {
  const BoolStringConverter();

  @override
  bool fromJson(dynamic json) =>
      json == true || json == "true" || json == "1" || json == 1;

  @override
  String toJson(bool object) => object.toString();
}

class IntStringConverter implements JsonConverter<int, dynamic> {
  const IntStringConverter();

  @override
  int fromJson(dynamic json) {
    if (json is int) return json;
    if (json is String) return int.tryParse(json) ?? 0;
    return 0;
  }

  @override
  String toJson(int object) => object.toString();
}

class IntMaybeEmptyStringConverter implements JsonConverter<int?, dynamic> {
  const IntMaybeEmptyStringConverter();

  @override
  int? fromJson(dynamic json) {
    if (json == null || json == "") return null;
    if (json is int) return json;
    if (json is String) return int.tryParse(json);
    return null;
  }

  @override
  String toJson(int? object) => object == null ? "" : object.toString();
}
