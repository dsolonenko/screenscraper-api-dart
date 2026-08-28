import 'package:screenscraper/src/roms/genres.dart';
import 'package:test/test.dart';

void main() {
  group('GameGenre Tests', () {
    test('isSubGenre correctly identifies sub-genres and top-level genres', () {
      expect(GameGenre.isSubGenre(GameGenre.Action), isFalse);
      expect(GameGenre.isSubGenre(GameGenre.RPG), isFalse);
      expect(GameGenre.isSubGenre(GameGenre.None), isFalse);

      expect(GameGenre.isSubGenre(GameGenre.ActionPlatformer), isTrue);
      expect(GameGenre.isSubGenre(GameGenre.ActionFighting), isTrue);
      expect(GameGenre.isSubGenre(GameGenre.RPGAction), isTrue);
      expect(GameGenre.isSubGenre(GameGenre.SportRacing), isTrue);
    });

    test('getTopGenre returns matching top-level category', () {
      expect(GameGenre.getTopGenre(GameGenre.ActionPlatformer), equals(GameGenre.Action));
      expect(GameGenre.getTopGenre(GameGenre.ActionFighting), equals(GameGenre.Action));
      expect(GameGenre.getTopGenre(GameGenre.RPGAction), equals(GameGenre.RPG));
      expect(GameGenre.getTopGenre(GameGenre.SportRacing), equals(GameGenre.Sports));
      expect(GameGenre.getTopGenre(GameGenre.Action), equals(GameGenre.Action));
      expect(GameGenre.getTopGenre(GameGenre.None), equals(GameGenre.None));
    });

    test('topGenreMatching correctly matches sub-genre to its top genre', () {
      // Matching
      expect(GameGenre.topGenreMatching(GameGenre.ActionPlatformer, GameGenre.Action), isTrue);
      expect(GameGenre.topGenreMatching(GameGenre.ActionFighting, GameGenre.Action), isTrue);
      expect(GameGenre.topGenreMatching(GameGenre.RPGAction, GameGenre.RPG), isTrue);
      expect(GameGenre.topGenreMatching(GameGenre.SportRacing, GameGenre.Sports), isTrue);

      // Non-matching
      expect(GameGenre.topGenreMatching(GameGenre.ActionPlatformer, GameGenre.RPG), isFalse);
      expect(GameGenre.topGenreMatching(GameGenre.RPGAction, GameGenre.Action), isFalse);
      expect(GameGenre.topGenreMatching(GameGenre.SportRacing, GameGenre.Adventure), isFalse);
    });

    test('lookupFromName finds correct genre or falls back to None', () {
      expect(GameGenre.lookupFromName('action'), equals(GameGenre.Action));
      expect(GameGenre.lookupFromName('actionplatformer'), equals(GameGenre.ActionPlatformer));
      expect(GameGenre.lookupFromName('nonexistent_genre'), equals(GameGenre.None));
    });

    test('lookupFromId finds correct genre or returns null/None', () {
      expect(GameGenre.lookupFromId(0x0100), equals(GameGenre.Action));
      expect(GameGenre.lookupFromId(0x0101), equals(GameGenre.ActionPlatformer));
      expect(GameGenre.lookupFromId(null), isNull);
      expect(GameGenre.lookupFromId(0xFFFF), equals(GameGenre.None));
    });
  });
}
