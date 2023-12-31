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
      final game = await api.gameInfo(GameInfoRequest.romByHash(
        systemId: 1,
        romName: "Sonic The Hedgehog 2 (World).zip",
        crc: "50ABC90A",
        romSizeBytes: 0,
      ));
      expect(game.id, equals(3));
      expect(game.romid, equals(12100));
    });

    test('Game Info By Id', () async {
      final game = await api.gameInfo(GameInfoRequest.gameById(
        systemId: 3,
        gameId: 1304,
      ));
      expect(game.id, equals(1304));
      expect(game.noms!.first.text, equals("Bubble Bobble"));
    });

    test('File hash', () async {
      final hash = await calculateFileHash(File("LICENSE"));
      expect(hash!.crc, equals("17573B7A"));
      expect(hash.md5, equals("25D8CB5523ACE4C823E6E3F0728421B5"));
      expect(hash.sha1, equals("1373452CAB7D3058C78038C03ABD54C32ACE5DFD"));
    });
  });
}
