Dart wrapper for ScreenScraper API V2.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

```dart
import 'package:screenscraper/screenscraper.dart';

void main() async {
  final api = ScreenScraperAPIV2.asTestUser();
  final stats = await api.infraInfo();
  print('Stats: ${stats.toJson()}');
}
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
