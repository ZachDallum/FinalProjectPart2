import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DataService {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<void> saveCredentials(
      {required String username, required String password}) async {
    await _storage.write(key: 'username', value: username);
    await _storage.write(key: 'password', value: password);
  }

  Future<Map<String, String>> getCredentials() async {
    final username = await _storage.read(key: 'username') ?? '';
    final password = await _storage.read(key: 'password') ?? '';

    return {'username': username, 'password': password};
  }
}
