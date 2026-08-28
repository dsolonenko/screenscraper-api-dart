// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'infra_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Servers _$ServersFromJson(Map<String, dynamic> json) => Servers(
  cpu1: const IntStringConverter().fromJson(json['cpu1']),
  cpu2: const IntStringConverter().fromJson(json['cpu2']),
  cpu3: const IntStringConverter().fromJson(json['cpu3']),
  cpu4: const IntStringConverter().fromJson(json['cpu4']),
  threadsmin: const IntStringConverter().fromJson(json['threadsmin']),
  nbscrapeurs: const IntStringConverter().fromJson(json['nbscrapeurs']),
  apiacces: const IntStringConverter().fromJson(json['apiacces']),
  closefornomember: const IntStringConverter().fromJson(
    json['closefornomember'],
  ),
  closeforleecher: const IntStringConverter().fromJson(json['closeforleecher']),
  maxthreadfornonmember: const IntStringConverter().fromJson(
    json['maxthreadfornonmember'],
  ),
  threadfornonmember: const IntStringConverter().fromJson(
    json['threadfornonmember'],
  ),
  maxthreadformember: const IntStringConverter().fromJson(
    json['maxthreadformember'],
  ),
  threadformember: const IntStringConverter().fromJson(json['threadformember']),
);

Map<String, dynamic> _$ServersToJson(Servers instance) => <String, dynamic>{
  'cpu1': const IntStringConverter().toJson(instance.cpu1),
  'cpu2': const IntStringConverter().toJson(instance.cpu2),
  'cpu3': const IntStringConverter().toJson(instance.cpu3),
  'cpu4': _$JsonConverterToJson<dynamic, int>(
    instance.cpu4,
    const IntStringConverter().toJson,
  ),
  'threadsmin': const IntStringConverter().toJson(instance.threadsmin),
  'nbscrapeurs': const IntStringConverter().toJson(instance.nbscrapeurs),
  'apiacces': const IntStringConverter().toJson(instance.apiacces),
  'closefornomember': const IntStringConverter().toJson(
    instance.closefornomember,
  ),
  'closeforleecher': const IntStringConverter().toJson(
    instance.closeforleecher,
  ),
  'maxthreadfornonmember': const IntStringConverter().toJson(
    instance.maxthreadfornonmember,
  ),
  'threadfornonmember': const IntStringConverter().toJson(
    instance.threadfornonmember,
  ),
  'maxthreadformember': const IntStringConverter().toJson(
    instance.maxthreadformember,
  ),
  'threadformember': const IntStringConverter().toJson(
    instance.threadformember,
  ),
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
