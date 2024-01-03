import 'package:json_annotation/json_annotation.dart';

part 'common.g.dart';

@JsonSerializable()
class IdText {
  @IntStringConverter()
  final int? id;
  final String text;

  IdText({required this.id, required this.text});

  factory IdText.fromJson(Map<String, dynamic> json) => _$IdTextFromJson(json);
  Map<String, dynamic> toJson() => _$IdTextToJson(this);
}

@JsonSerializable()
class RegionText {
  final String region;
  final String text;

  RegionText({required this.region, required this.text});

  factory RegionText.fromJson(Map<String, dynamic> json) => _$RegionTextFromJson(json);
  Map<String, dynamic> toJson() => _$RegionTextToJson(this);
}

@JsonSerializable()
class LangText {
  final String langue;
  final String text;

  LangText({required this.langue, required this.text});

  factory LangText.fromJson(Map<String, dynamic> json) => _$LangTextFromJson(json);
  Map<String, dynamic> toJson() => _$LangTextToJson(this);
}

@JsonSerializable()
class TypeText {
  final String type;
  final String text;

  TypeText({required this.type, required this.text});

  factory TypeText.fromJson(Map<String, dynamic> json) => _$TypeTextFromJson(json);
  Map<String, dynamic> toJson() => _$TypeTextToJson(this);
}

@JsonSerializable()
class Response {
  final Header header;
  final Map<String, dynamic> response;

  Response({required this.header, required this.response});

  factory Response.fromJson(Map<String, dynamic> json) => _$ResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}

@JsonSerializable()
class Data {
  @IntStringConverter()
  final int id;
  final String nomcourt;
  final String principale;
  final String parentid;
  final List<LangText> noms;

  Data({
    required this.id,
    required this.nomcourt,
    required this.principale,
    required this.parentid,
    required this.noms,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Header {
  @JsonKey(name: 'APIversion')
  final String apiVersion;
  final String dateTime;
  final String commandRequested;
  @BoolStringConverter()
  final bool success;
  final String error;

  Header({
    required this.apiVersion,
    required this.dateTime,
    required this.commandRequested,
    required this.success,
    required this.error,
  });

  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);
  Map<String, dynamic> toJson() => _$HeaderToJson(this);
}

class BoolStringConverter implements JsonConverter<bool, String> {
  const BoolStringConverter();

  @override
  bool fromJson(String json) => json == "true";

  @override
  String toJson(bool object) => object.toString();
}

class IntStringConverter implements JsonConverter<int, String> {
  const IntStringConverter();

  @override
  int fromJson(String json) => int.parse(json);

  @override
  String toJson(int object) => object.toString();
}

class IntMaybeEmptyStringConverter implements JsonConverter<int?, String> {
  const IntMaybeEmptyStringConverter();

  @override
  int? fromJson(String json) => json == "" ? null : int.parse(json);

  @override
  String toJson(int? object) => object == null ? "" : object.toString();
}
