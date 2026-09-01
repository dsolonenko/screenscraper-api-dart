import 'package:screenscraper/screenscraper.dart';
import 'package:screenscraper/src/screenscraper/common.dart';
import 'package:screenscraper/src/screenscraper/game_info.dart';
import 'package:test/test.dart';

void main() {
  group('Scraper Region and Language Priority Tests', () {
    test('Game.fromGameInfo respects regionPriority for media and names', () {
      final gameInfo = GameInfo(
        id: 100,
        romid: 1,
        notgame: false,
        noms: [
          RegionText(region: 'jp', text: 'Super Mario World (Japan)'),
          RegionText(region: 'wor', text: 'Super Mario World (World)'),
          RegionText(region: 'us', text: 'Super Mario World (USA)'),
        ],
        cloneof: null,
        systeme: IdText(id: 4, text: 'Super Nintendo'),
        editeur: IdText(id: 1, text: 'Nintendo'),
        developpeur: IdText(id: 1, text: 'Nintendo'),
        joueurs: IdText(id: 2, text: '1-2'),
        note: IdText(id: 0, text: '19.5'),
        topstaff: true,
        rotation: null,
        synopsis: [
          LangText(langue: 'ja', text: 'Japanese synopsis'),
          LangText(langue: 'en', text: 'English synopsis'),
        ],
        classifications: null,
        dates: [
          RegionText(region: 'jp', text: '1990-11-21'),
          RegionText(region: 'us', text: '1991-08-13'),
        ],
        genres: null,
        modes: null,
        familles: null,
        actions: null,
        medias: [
          GameMedia(
            type: 'wheel',
            parent: 'jeu',
            url: 'https://screenscraper.fr/media/wheel_jp.png',
            region: 'jp',
            format: 'png',
          ),
          GameMedia(
            type: 'wheel',
            parent: 'jeu',
            url: 'https://screenscraper.fr/media/wheel_us.png',
            region: 'us',
            format: 'png',
          ),
          GameMedia(
            type: 'box-2D',
            parent: 'jeu',
            url: 'https://screenscraper.fr/media/box_jp.png',
            region: 'jp',
            format: 'png',
          ),
          GameMedia(
            type: 'box-2D',
            parent: 'jeu',
            url: 'https://screenscraper.fr/media/box_us.png',
            region: 'us',
            format: 'png',
          ),
        ],
        roms: null,
        rom: null,
      );

      final game = Game.fromGameInfo(
        gameInfo,
        regionPriority: ['wor', 'us', 'eu', 'jp'],
        languagePriority: ['en', 'ja'],
      );

      expect(game.name, equals('Super Mario World (World)'));
      expect(game.description, equals('English synopsis'));
      expect(game.media.wheel?.url, equals('https://screenscraper.fr/media/wheel_us.png'));
      expect(game.media.box2d?.url, equals('https://screenscraper.fr/media/box_us.png'));
    });

    test('Game.fromGameInfo falls back to wheel-hd if wheel is missing', () {
      final gameInfo = GameInfo(
        id: 200,
        romid: 2,
        notgame: false,
        noms: [
          RegionText(region: 'us', text: 'Test Game'),
        ],
        cloneof: null,
        systeme: IdText(id: 4, text: 'Super Nintendo'),
        editeur: null,
        developpeur: null,
        joueurs: null,
        note: null,
        topstaff: null,
        rotation: null,
        synopsis: null,
        classifications: null,
        dates: null,
        genres: null,
        modes: null,
        familles: null,
        actions: null,
        medias: [
          GameMedia(
            type: 'wheel-hd',
            parent: 'jeu',
            url: 'https://screenscraper.fr/media/wheel_hd_wor.png',
            region: 'wor',
            format: 'png',
          ),
        ],
        roms: null,
        rom: null,
      );

      final game = Game.fromGameInfo(
        gameInfo,
        regionPriority: ['wor', 'us', 'eu', 'jp'],
      );

      expect(game.media.wheel?.url, equals('https://screenscraper.fr/media/wheel_hd_wor.png'));
    });
  });
}
