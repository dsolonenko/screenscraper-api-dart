import 'package:screenscraper/src/screenscraper/apiv2.dart';
import 'package:test/test.dart';

void main() {
  group('HttpLogger & Request formatting', () {
    test('sanitizeUrl should remove credentials from URL', () {
      final logger = HttpLogger();
      const url =
          'https://api.screenscraper.fr/api2/jeuInfos.php?devid=aaa&devpassword=bbb&softname=ccc&ssid=ddd&sspassword=eee&output=json&systemeid=82&romtype=rom&crc=1E560D9&md5=A440B85B596BF843951D2F82ED462E55&sha1=95DC7AF619CBFE16D250E5A4F284F8B7DFF39FA0&romtaille=635199';
      const expectedUrl =
          'https://api.screenscraper.fr/api2/jeuInfos.php?devid=***&devpassword=***&softname=***&ssid=***&sspassword=***&output=json&systemeid=82&romtype=rom&crc=1E560D9&md5=A440B85B596BF843951D2F82ED462E55&sha1=95DC7AF619CBFE16D250E5A4F284F8B7DFF39FA0&romtaille=635199';

      expect(logger.sanitizeUrl(url), equals(expectedUrl));
    });

    test('GameInfoRequest handles Unicode ROM names without crashing or double encoding', () {
      final request = GameInfoRequest.romByHash(
        systemId: 12,
        romName: 'Pokémon - Version Émeraude (France).gba',
        crc: '12345678',
        romSizeBytes: 16777216,
      );

      final params = request.toQueryParameters();
      expect(params['romnom'], equals('Pokémon - Version Émeraude (France).gba'));
      expect(params['systemeid'], equals('12'));
      expect(params['crc'], equals('12345678'));
      expect(params['romtaille'], equals('16777216'));
    });
  });
}
