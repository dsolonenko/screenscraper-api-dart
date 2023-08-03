// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'infra_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Servers _$ServersFromJson(Map<String, dynamic> json) => Servers(
      cpu1: const IntStringConverter().fromJson(json['cpu1'] as String),
      cpu2: const IntStringConverter().fromJson(json['cpu2'] as String),
      cpu3: const IntStringConverter().fromJson(json['cpu3'] as String),
      threadsmin:
          const IntStringConverter().fromJson(json['threadsmin'] as String),
      nbscrapeurs:
          const IntStringConverter().fromJson(json['nbscrapeurs'] as String),
      apiacces: const IntStringConverter().fromJson(json['apiacces'] as String),
      closefornomember: const IntStringConverter()
          .fromJson(json['closefornomember'] as String),
      closeforleecher: const IntStringConverter()
          .fromJson(json['closeforleecher'] as String),
      maxthreadfornonmember: const IntStringConverter()
          .fromJson(json['maxthreadfornonmember'] as String),
      threadfornonmember: const IntStringConverter()
          .fromJson(json['threadfornonmember'] as String),
      maxthreadformember: const IntStringConverter()
          .fromJson(json['maxthreadformember'] as String),
      threadformember: const IntStringConverter()
          .fromJson(json['threadformember'] as String),
    );

Map<String, dynamic> _$ServersToJson(Servers instance) => <String, dynamic>{
      'cpu1': const IntStringConverter().toJson(instance.cpu1),
      'cpu2': const IntStringConverter().toJson(instance.cpu2),
      'cpu3': const IntStringConverter().toJson(instance.cpu3),
      'threadsmin': const IntStringConverter().toJson(instance.threadsmin),
      'nbscrapeurs': const IntStringConverter().toJson(instance.nbscrapeurs),
      'apiacces': const IntStringConverter().toJson(instance.apiacces),
      'closefornomember':
          const IntStringConverter().toJson(instance.closefornomember),
      'closeforleecher':
          const IntStringConverter().toJson(instance.closeforleecher),
      'maxthreadfornonmember':
          const IntStringConverter().toJson(instance.maxthreadfornonmember),
      'threadfornonmember':
          const IntStringConverter().toJson(instance.threadfornonmember),
      'maxthreadformember':
          const IntStringConverter().toJson(instance.maxthreadformember),
      'threadformember':
          const IntStringConverter().toJson(instance.threadformember),
    };
