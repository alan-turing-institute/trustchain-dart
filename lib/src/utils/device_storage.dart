import 'dart:io';
import 'package:path_provider/path_provider.dart';


class Storage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> readTrustchainOperation(String fileName) async {
    final path = await _localPath;
    return File('$path/.trustchain/operations/$fileName');
  }
}