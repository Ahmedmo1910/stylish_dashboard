import 'dart:io';
import 'package:stylish_dashboard/constants.dart';
import 'package:stylish_dashboard/core/services/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;
  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseKey,
    );
  }

  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = p.basename(file.path);
    String extentionName = p.extension(file.path);
    var result = await _supabase.client.storage
        .from('product_images')
        .upload('$path/$fileName.$extentionName', file);
    final String publicUrl = _supabase.client.storage
        .from('product_images')
        .getPublicUrl('$path/$fileName.$extentionName');
    return result;
  }
}
