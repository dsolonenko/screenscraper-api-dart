import 'package:screenscraper/screenscraper.dart';

void main() async {
  final scraper = RomScraper(
    devId: "xxx",
    devPassword: "yyy",
    softwareName: "xxx",
    userName: "test",
    userPassword: "test",
  );
  final game = await scraper.scrapeRom("12", "WarioWare, Inc. - Mega Microgame\$! (USA).zip");
  print('Game ${game.name} released on ${game.systemName} in ${game.releaseDate}');
}
