import 'dart:io';

import 'package:screenscraper/src/roms/file_hash.dart';
import 'package:screenscraper/src/screenscraper/apiv2.dart';
import 'package:test/test.dart';

void main() {
  group('Live API V2 Tests', () {
    final api = ScreenScraperAPIV2.asTestUser();

    setUpAll(() {
      HttpOverrides.global = null;
    });

    tearDownAll(() {
      api.close();
    });

    test('Infra Info', () async {
      final servers = await api.infraInfo();
      expect(servers.isClosedForLeecher, isFalse);
    });

    test('Game Info By Hash', () async {
      final game = await api.gameInfo(
        GameInfoRequest.romByHash(
          systemId: 1,
          romName: "Sonic The Hedgehog 2 (World).zip",
          crc: "50ABC90A",
          romSizeBytes: 0,
        ),
      );
      expect(game.id, equals(3));
      expect(game.romid, isNotNull);
    });

    test('Game Info By Id requires valid credentials', () async {
      expect(
        () => api.gameInfo(GameInfoRequest.gameById(systemId: 3, gameId: 1304)),
        throwsA(isA<ScreenScraperException>()),
      );
    });

    test('File hash', () async {
      final hash = await calculateFileHash(File("LICENSE"));
      expect(hash, isNotNull);
      expect(hash!.sizeBytes, equals(File("LICENSE").lengthSync()));
    });
  });
}
