import 'dart:io';

import 'package:chunked_stream/chunked_stream.dart';
import 'package:crclib/catalog.dart';
import 'package:crclib/crclib.dart';
import 'package:crypto/crypto.dart';

import 'package:convert/convert.dart';

class FileHash {
  final String crc;
  final String md5;
  final String sha1;

  FileHash({
    required this.crc,
    required this.md5,
    required this.sha1,
  });
}

Future<FileHash?> calculateFileHash(File file) async {
  if (!file.existsSync()) return null;
  try {
    final stream = file.openRead();
    final bufferedStream = bufferChunkedStream(stream, bufferSize: 128 * 1024);
    // ignore: deprecated_member_use
    final iterator = ChunkedStreamIterator(bufferedStream);
    try {
      final md5out = AccumulatorSink<Digest>();
      final md5in = md5.startChunkedConversion(md5out);
      final sha1out = AccumulatorSink<Digest>();
      final sha1in = sha1.startChunkedConversion(sha1out);
      final crcout = AccumulatorSink<CrcValue>();
      final crcin = Crc32().startChunkedConversion(crcout);

      while (true) {
        final chunk = await iterator.read(32 * 1024);
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
      final crc32hash = crcout.events.single.toRadixString(16).toUpperCase();

      return FileHash(
        crc: crc32hash,
        md5: md5hash,
        sha1: sha1hash,
      );
    } finally {
      await iterator.cancel();
    }
  } catch (exception) {
    return null;
  }
}
