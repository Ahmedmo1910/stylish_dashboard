import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as b;
import 'package:stylish_dashboard/core/services/storage_service.dart';

class FireStorage implements StorageService {
  final storageReference = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = b.basename(file.path);
    String extentionName = b.extension(file.path);
    var fileReference =
        storageReference.child('$path/$fileName.$extentionName');
    await fileReference.putFile(file);
    var fileUrl = await fileReference.getDownloadURL();
    return fileUrl;
  }
}
