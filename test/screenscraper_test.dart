import 'dart:io';

import 'package:screenscraper/screenscraper.dart';
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
      expect(servers.isClosedForNonMember, isFalse);
    });

    test('Game Info', () async {
      final game = await api.gameInfo(
          GameInfoRequest.romByHash(systemeid: "1", romnom: "Sonic The Hedgehog 2 (World).zip", crc: "50ABC90A"));
      expect(game.id, equals("3"));
      expect(game.romid, equals("12100"));
    });
  });
}
