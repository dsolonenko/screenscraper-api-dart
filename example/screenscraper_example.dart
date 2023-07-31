import 'package:screenscraper/screenscraper.dart';

void main() async {
  final api = ScreenScraperAPIV2.asTestUser();
  final stats = await api.infraInfo();
  print('Stats: ${stats.toJson()}');
}
