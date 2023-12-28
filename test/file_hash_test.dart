import 'dart:io';
import 'package:screenscraper/src/roms/file_hash.dart';
import 'package:test/test.dart';

void main() {
  test('Plain File Hash Test', () async {
    final filePath = 'Metal Slug - 1st Mission (W).ngc';
    final hash = await calculateFileHash(File(filePath));
    expect(hash!.crc, '4FF91807');
    expect(hash.md5, '4D3EFEF436C67D4F4E031951B97D64C8');
    expect(hash.sha1, '3540BB6EFBBC4F37992D2A871B8D83B4FCA0E76E');
    expect(hash.sizeBytes, 2097152);
  });

  test('Zip File Hash Test', () async {
    final filePath = 'Metal Slug - 1st Mission (W).zip';
    final hash = await calculateFileHash(File(filePath));
    expect(hash!.crc, '4FF91807');
    expect(hash.md5, '4D3EFEF436C67D4F4E031951B97D64C8');
    expect(hash.sha1, '3540BB6EFBBC4F37992D2A871B8D83B4FCA0E76E');
    expect(hash.sizeBytes, 2097152);
  });
}
