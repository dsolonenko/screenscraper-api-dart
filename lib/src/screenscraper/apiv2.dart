import 'dart:convert';

import 'package:screenscraper/src/screenscraper/common.dart';
import 'package:screenscraper/src/screenscraper/game_info.dart';
import 'package:screenscraper/src/screenscraper/infra_info.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';

/// Dart wrapper for ScreenScraper API V2
class ScreenScraperAPIV2 {
  final String devId;
  final String devPassword;
  final String softwareName;
  final String userName;
  final String userPassword;

  final HttpClientWithMiddleware _http = HttpClientWithMiddleware.build(
    requestTimeout: Duration(seconds: 30),
    middlewares: [
      HttpLogger(logLevel: LogLevel.NONE), // BASIC leaks passwords into logs
    ],
  );

  ScreenScraperAPIV2({
    required this.devId,
    required this.devPassword,
    required this.softwareName,
    required this.userName,
    required this.userPassword,
  });

  /// Use leecher credentials, for testing purposes
  factory ScreenScraperAPIV2.asTestUser() => ScreenScraperAPIV2(
        devId: "xxx",
        devPassword: "yyy",
        softwareName: "zzz",
        userName: "test",
        userPassword: "test",
      );

  /// ssinfraInfos.php: Information about the ScreenScraper framework
  Future<Servers> infraInfo() async {
    final apiResponse = await _getApiResponse("ssinfraInfos.php");
    return Servers.fromJson(apiResponse.response['serveurs']);
  }

  /// jeuInfos.php: Information on a game / Media of a game
  Future<GameInfo> gameInfo(GameInfoRequest request) async {
    final apiResponse = await _getApiResponse("jeuInfos.php", params: request.toQueryParameters());
    return GameInfo.fromJson(apiResponse.response['jeu']);
  }

  Future<Response> _getApiResponse(String path, {Map<String, dynamic>? params}) async {
    final httpResponse = await _http.get(_buildUrl(path, params: params));
    if (httpResponse.statusCode != 200) {
      throw Exception("Error ${httpResponse.statusCode}: ${httpResponse.body}}");
    }
    final json = jsonDecode(httpResponse.body);
    return Response.fromJson(json);
  }

  Uri _buildUrl(String path, {Map<String, dynamic>? params}) {
    final required = {
      'devid': devId,
      'devpassword': devPassword,
      'softname': softwareName,
      'ssid': userName,
      'sspassword': userPassword,
      'output': 'json',
    };
    return Uri.https('www.screenscraper.fr', "api2/$path", {...required, ...params ?? {}});
  }

  void close() {
    _http.close();
  }
}

class GameInfoRequest {
  final String? crc;
  final String? md5;
  final String? sha1;
  final String systemeid;
  final String romtype;
  final String romnom;
  final int? romtaille;
  final int? serialnum;
  final String? gameid;

  GameInfoRequest({
    required this.systemeid,
    required this.romtype,
    required this.romnom,
    this.crc,
    this.md5,
    this.sha1,
    this.romtaille,
    this.serialnum,
    this.gameid,
  });

  factory GameInfoRequest.romByHash({
    required String systemeid,
    required String romnom,
    String? crc,
    String? md5,
    String? sha1,
  }) {
    if (crc == null && md5 == null && sha1 == null) {
      throw ArgumentError("At least one of crc|md5|sha1 is required");
    }
    return GameInfoRequest(
      systemeid: systemeid,
      romtype: "rom",
      romnom: romnom,
      crc: crc,
      md5: md5,
      sha1: sha1,
    );
  }

  Map<String, dynamic> toQueryParameters() => {
        'systemeid': systemeid,
        'romtype': romtype,
        'romnom': romnom,
        if (crc != null) 'crc': crc,
        if (md5 != null) 'md5': md5,
        if (sha1 != null) 'sha1': sha1,
        if (romtaille != null) 'romtaille': romtaille,
        if (serialnum != null) 'serialnum': serialnum,
        if (gameid != null) 'gameid': gameid,
      };
}
