import 'package:test/test.dart';

void main() {
  test('sanitizeUrl should remove query parameters from the URL', () {
    String url =
        'https://www.screenscraper.fr/api2/jeuInfos.php?devid=aaa&devpassword=bbb&softname=ccc&ssid=ddd&sspassword=eee&output=json&systemeid=82&romtype=rom&crc=1E560D9&md5=A440B85B596BF843951D2F82ED462E55&sha1=95DC7AF619CBFE16D250E5A4F284F8B7DFF39FA0&romtaille=635199';
    String expectedUrl =
        'https://www.screenscraper.fr/api2/jeuInfos.php?devid=***&devpassword=***&softname=***&ssid=***&sspassword=***&output=json&systemeid=82&romtype=rom&crc=1E560D9&md5=A440B85B596BF843951D2F82ED462E55&sha1=95DC7AF619CBFE16D250E5A4F284F8B7DFF39FA0&romtaille=635199';

    String sanitizedUrl = sanitizeUrl(url);

    expect(sanitizedUrl, equals(expectedUrl));
  });
}

String sanitizeUrl(String url) {
  final keys = ['devid', 'devpassword', 'softname', 'ssid', 'sspassword'];
  for (var key in keys) {
    final regex = RegExp(r'(?<=' + key + r'=)[^&]+');
    url = url.replaceAll(regex, '***');
  }
  return url;
}
