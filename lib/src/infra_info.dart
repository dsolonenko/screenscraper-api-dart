// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
import 'package:screenscraper/src/common.dart';

part 'infra_info.g.dart';

@JsonSerializable()
class Servers {
  @IntStringConverter()
  final int cpu1;
  @IntStringConverter()
  final int cpu2;
  @IntStringConverter()
  final int cpu3;
  @IntStringConverter()
  final int threadsmin;
  @IntStringConverter()
  final int nbscrapeurs;
  @IntStringConverter()
  final int apiacces;
  @IntStringConverter()
  final int closefornomember;
  @IntStringConverter()
  final int closeforleecher;
  @IntStringConverter()
  final int maxthreadfornonmember;
  @IntStringConverter()
  final int threadfornonmember;
  @IntStringConverter()
  final int maxthreadformember;
  @IntStringConverter()
  final int threadformember;

  bool get isClosedForNonMember => closefornomember == 1;
  bool get isClosedForLeecher => closeforleecher == 1;

  Servers({
    required this.cpu1,
    required this.cpu2,
    required this.cpu3,
    required this.threadsmin,
    required this.nbscrapeurs,
    required this.apiacces,
    required this.closefornomember,
    required this.closeforleecher,
    required this.maxthreadfornonmember,
    required this.threadfornonmember,
    required this.maxthreadformember,
    required this.threadformember,
  });

  factory Servers.fromJson(Map<String, dynamic> json) => _$ServersFromJson(json);
  Map<String, dynamic> toJson() => _$ServersToJson(this);
}
