import 'dart:io';

import 'package:screenscraper/screenscraper.dart';
import 'package:screenscraper/src/file_hash.dart';
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
      final game = await api.gameInfo(GameInfoRequest.romByHash(
        systemeid: "1",
        romnom: "Sonic The Hedgehog 2 (World).zip",
        crc: "50ABC90A",
      ));
      expect(game.id, equals("3"));
      expect(game.romid, equals("12100"));
    });

    test('File hash', () async {
      final hash = await getFileHash("WarioWare, Inc. - Mega Microgame\$! (USA).gba");
      expect(hash!.crc, equals("785D8B8C"));
      expect(hash.md5, equals("A2D26DC774CEC9A0B47388A5DD727B03"));
      expect(hash.sha1, equals("3F556448D290FA5406D6ED367FEE16CC02387AD3"));
    });
  });
}
