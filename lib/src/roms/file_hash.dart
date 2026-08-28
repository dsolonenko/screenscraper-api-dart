import 'dart:io';

import 'package:archive/archive_io.dart' as zip;
import 'package:async/async.dart';
import 'package:crclib/catalog.dart';
import 'package:crclib/crclib.dart';
import 'package:crypto/crypto.dart';

import 'package:convert/convert.dart';

class FileHash {
  final String crc;
  final String md5;
  final String sha1;
  final int sizeBytes;

  FileHash({
    required this.crc,
    required this.md5,
    required this.sha1,
    required this.sizeBytes,
  });
}

Future<FileHash?> calculateFileHash(File file) async {
  if (!file.existsSync()) return null;
  final sw = Stopwatch()..start();
  try {
    int fileSize = 0;
    Stream<List<int>>? stream;
    if (file.path.endsWith('.zip')) {
      final zipStream = zip.InputFileStream(file.path);
      try {
        final archive = zip.ZipDecoder().decodeStream(zipStream);
        if (archive.numberOfFiles() == 1) {
          final data = archive.fileData(0);
          stream = Stream.value(data);
          fileSize = archive.fileSize(0);
        }
      } finally {
        await zipStream.close();
      }
    }
    if (stream == null) {
      stream = file.openRead();
      fileSize = file.lengthSync();
    }
    final reader = ChunkedStreamReader(stream);
    try {
      final md5out = AccumulatorSink<Digest>();
      final md5in = md5.startChunkedConversion(md5out);
      final sha1out = AccumulatorSink<Digest>();
      final sha1in = sha1.startChunkedConversion(sha1out);
      final crcout = AccumulatorSink<CrcValue>();
      final crcin = Crc32().startChunkedConversion(crcout);

      while (true) {
        final chunk = await reader.readChunk(32 * 1024);
        if (chunk.isEmpty) {
          break;
        }
        md5in.add(chunk);
        sha1in.add(chunk);
        crcin.add(chunk);
      }
      md5in.close();
      sha1in.close();
      crcin.close();

      final md5hash = md5out.events.single.toString().toUpperCase();
      final sha1hash = sha1out.events.single.toString().toUpperCase();
      final crc32hash = crcout.events.single.toRadixString(16).toUpperCase().padLeft(8, '0');

      return FileHash(
        crc: crc32hash,
        md5: md5hash,
        sha1: sha1hash,
        sizeBytes: fileSize,
      );
    } finally {
      await reader.cancel();
    }
  } catch (exception) {
    print(exception);
    return null;
  } finally {
    sw.stop();
    print('calculateFileHash: ${sw.elapsed}');
  }
}
