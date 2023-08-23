import 'dart:convert';

import 'package:screenscraper/src/screenscraper/common.dart';
import 'package:screenscraper/src/screenscraper/game_info.dart';
import 'package:screenscraper/src/screenscraper/infra_info.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';

/// ScreenScraper API response error
class ScreenScraperException implements Exception {
  final int code;
  final String message;

  ScreenScraperException({required this.code, required this.message});

  factory ScreenScraperException.fromHttpResponse(int statusCode, String body) {
    switch (statusCode) {
      case 401:
        return WaitAndRetryException(
          code: 401,
          message:
              "API closed for non-members or inactive members The Server is saturated (CPU usage>60%)",
        );
      case 403:
        return DoNotRetryException(
          code: 403,
          message:
              "Login error: Check your developer credentials! incorrect developer credentials",
        );
      case 423:
        return DoneForTheDayException(
          code: 423,
          message: "API totally closed The Server has a serious problem",
        );
      case 426:
        return DoNotRetryException(
          code: 426,
          message:
              "The scraping software used has been blacklisted (non-compliant / obsolete version) The software version must be changed",
        );
      case 429:
        return WaitAndRetryException(
          code: 429,
          message: "Need to reduce request speed",
        );
      case 430:
        return DoneForTheDayException(
          code: 430,
          message:
              "Your scrape quota is exceeded for today! The member has scraped more than x (see F.A.Q) roms during the day",
        );
      case 431:
        return DoneForTheDayException(
          code: 431,
          message:
              "Sort through your rom files and come back tomorrow! The member has scraped more than x (see F.A.Q) roms not recognized by ScreenScraper",
        );
      default:
        return ScreenScraperException(code: statusCode, message: body);
    }
  }

  @override
  String toString() {
    return "$code:$message";
  }
}

/// Do not send any more requests today - daily quota exceeded
class DoneForTheDayException extends ScreenScraperException {
  DoneForTheDayException({required int code, required String message})
      : super(code: code, message: message);
}

/// Critical error in the response, do not retry without investigating
class DoNotRetryException extends ScreenScraperException {
  DoNotRetryException({required int code, required String message})
      : super(code: code, message: message);
}

/// Temporary error in the response, retry after a delay
class WaitAndRetryException extends ScreenScraperException {
  WaitAndRetryException({required int code, required String message})
      : super(code: code, message: message);
}

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
    final apiResponse = await _getApiResponse("jeuInfos.php",
        params: request.toQueryParameters());
    return GameInfo.fromJson(apiResponse.response['jeu']);
  }

  Future<Response> _getApiResponse(String path,
      {Map<String, dynamic>? params}) async {
    final httpResponse = await _http.get(_buildUrl(path, params: params));
    if (httpResponse.statusCode != 200) {
      throw ScreenScraperException.fromHttpResponse(
          httpResponse.statusCode, httpResponse.body);
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
    return Uri.https(
        'www.screenscraper.fr', "api2/$path", {...required, ...params ?? {}});
  }

  void close() {
    _http.close();
  }
}

class GameInfoRequest {
  final String? crc;
  final String? md5;
  final String? sha1;
  final int systemeid;
  final String romtype;
  final String romnom;
  final int? romtaille;
  final int? serialnum;
  final int? gameid;

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
    required int systemeid,
    required String romnom,
    String? crc,
    String? md5,
    String? sha1,
    required int sizeBytes,
  }) {
    if (crc == null && md5 == null && sha1 == null) {
      throw ArgumentError("At least one of crc|md5|sha1 is required");
    }
    return GameInfoRequest(
      systemeid: systemeid,
      romtype: "rom",
      romnom: romnom,
      romtaille: sizeBytes,
      crc: crc,
      md5: md5,
      sha1: sha1,
    );
  }

  Map<String, dynamic> toQueryParameters() => {
        'systemeid': systemeid.toString(),
        'romtype': romtype,
        'romnom': Uri.encodeQueryComponent(romnom, encoding: ascii),
        if (crc != null) 'crc': crc,
        if (md5 != null) 'md5': md5,
        if (sha1 != null) 'sha1': sha1,
        if (romtaille != null) 'romtaille': romtaille.toString(),
        if (serialnum != null) 'serialnum': serialnum.toString(),
        if (gameid != null) 'gameid': gameid.toString(),
      };
}
