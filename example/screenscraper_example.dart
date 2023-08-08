import 'package:screenscraper/screenscraper.dart';

void main() async {
  final scraper = RomScraper(
    devId: "xxx",
    devPassword: "yyy",
    softwareName: "zzz",
    userName: "test",
    userPassword: "test",
  );
  final game = await scraper.scrapeRom(
    systemId: 12,
    romPath: "WarioWare, Inc. - Mega Microgame\$! (USA).gba",
  );
  print(
      'Game ${game.name} released on ${game.systemName} in ${game.releaseYear}');
}
