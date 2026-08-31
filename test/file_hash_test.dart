import 'dart:io';
import 'dart:typed_data';
import 'package:archive/archive.dart';
import 'package:screenscraper/src/roms/file_hash.dart';
import 'package:test/test.dart';

void main() {
  late Directory tempDir;

  setUp(() {
    tempDir = Directory.systemTemp.createTempSync('file_hash_test_');
  });

  tearDown(() {
    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  });

  test('Non-existent file returns null', () async {
    final hash = await calculateFileHash(
      File('${tempDir.path}/non_existent.bin'),
    );
    expect(hash, isNull);
  });

  test('Plain File Hash Test', () async {
    final file = File('${tempDir.path}/test.bin');
    final bytes = Uint8List.fromList([1, 2, 3, 4, 5]);
    file.writeAsBytesSync(bytes);

    final hash = await calculateFileHash(file);
    expect(hash, isNotNull);
    expect(hash!.sizeBytes, 5);
    expect(hash.crc, '470B99F4');
    expect(hash.md5, '7CFDD07889B3295D6A550914AB35E068');
    expect(hash.sha1, '11966AB9C099F8FABEFAC54C08D5BE2BD8C903AF');
  });

  test('Zip File Hash Test (unzips and hashes internal single file)', () async {
    final zipFile = File('${tempDir.path}/test.zip');
    final innerData = Uint8List.fromList([1, 2, 3, 4, 5]);
    final archive = Archive();
    archive.addFile(ArchiveFile('rom.bin', innerData.length, innerData));
    final encoded = ZipEncoder().encode(archive);
    zipFile.writeAsBytesSync(encoded);

    final hash = await calculateFileHash(zipFile);
    expect(hash, isNotNull);
    expect(hash!.sizeBytes, 5);
    expect(hash.crc, '470B99F4');
    expect(hash.md5, '7CFDD07889B3295D6A550914AB35E068');
    expect(hash.sha1, '11966AB9C099F8FABEFAC54C08D5BE2BD8C903AF');
  });

  test('CRC32 padding (8 hex digits)', () async {
    final file = File('${tempDir.path}/zero.bin');
    file.writeAsBytesSync(Uint8List.fromList([]));

    final hash = await calculateFileHash(file);
    expect(hash, isNotNull);
    expect(hash!.crc, '00000000');
    expect(hash.crc.length, 8);
  });

  test('Files exceeding maxSizeBytes are skipped', () async {
    final file = File('${tempDir.path}/large.bin');
    file.writeAsBytesSync(Uint8List(1000));

    final skipped = await calculateFileHash(file, maxSizeBytes: 500);
    expect(skipped, isNull);

    final hashed = await calculateFileHash(file, maxSizeBytes: 2000);
    expect(hashed, isNotNull);
    expect(hashed!.sizeBytes, 1000);
  });
}
