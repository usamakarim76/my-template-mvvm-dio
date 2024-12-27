import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  // Create an instance of FlutterSecureStorage
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // Method to store data
  Future<bool> setValue(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
    return true;
  }

  // Method to read data
  Future<dynamic> readValue(String key) async {
    return await _secureStorage.read(key: key);
  }

  // Method to delete data
  Future<bool> deleteValue(String key) async {
    await _secureStorage.delete(key: key);
    return true;
  }

  // Method to delete all data
  Future<bool> deleteAllData() async {
    await _secureStorage.deleteAll();
    return true;
  }
}
