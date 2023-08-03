ROM scraper that uses ScreenScraper API V2.

## Features

- Calculates required hashes for the ROM file
- Calls ScreenScraper API V2 to get the matching game details
- Provides selected  game details based on the language/region priority

## Usage

```dart
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
    systemId: "12",
    romPath: "WarioWare, Inc. - Mega Microgame\$! (USA).gba",
  );
  print('Game ${game.name} released on ${game.systemName} in ${game.releaseDate}');
}
```