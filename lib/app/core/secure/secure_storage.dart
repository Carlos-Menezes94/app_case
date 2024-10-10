import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions.defaultOptions,
  );

  Future<void> saveEncryptedData(String key, String data) async {
    try {
      await secureStorage.write(key: key, value: data);
    } catch (e) {
      debugPrint('Error saving data: $e');
    }
  }

  Future<String?> getEncryptedData(String key) async {
    try {
      final encryptedData = await secureStorage.read(key: key);
      return encryptedData;
    } catch (e) {
      debugPrint('Error reading data: $e');
      return null;
    }
  }

  Future<void> deleteEncryptedData(String key) async {
    try {
      await secureStorage.delete(key: key);
    } catch (e) {
      debugPrint('Error deleting data: $e');
    }
  }
}
