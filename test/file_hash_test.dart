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

  test('Should pad CRC32', () async {
    final filePath = 'Mr. Do! by Ivan Mackintosh (PD).zip';
    final hash = await calculateFileHash(File(filePath));
    expect(hash!.crc, '0098C7B5');
    expect(hash.md5, '2EE3331DD1E34020BBAFDD91DF0CE1BB');
    expect(hash.sha1, '3E0EA487D3647936413A42570D0A1A6565CC6EC9');
    expect(hash.sizeBytes, 16152);
  });
}
