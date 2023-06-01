import 'dart:io';
import 'package:path_provider/path_provider.dart';


class Storage {
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> readTrustchainOperation(String fileName) async {
    final path = await _localPath;
    return File('$path/.trustchain/operations/$fileName');
  }

  static Future<File> readTrustchainDidJWK(String did) async {
    final path = await _localPath;
    return File('$path/.trustchain/key_manager/$did/signing_key.json');
  }

}