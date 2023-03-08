/*
* Developer: Abubakar Abdullahi
* Date: 09/02/2023
*/

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static const _userIdKey = 'amera-store-user-id';
  static const _emailKey = 'amera-store-email';
  static const _nameKey = 'amera-store-name';
  static const _userTypeKey = 'amera-store-user-type';

  const UserSecureStorage({
    FlutterSecureStorage? secureStorage,
  }) : _secureStorage = secureStorage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _secureStorage;

  Future<void> upsertUserInfo({
    String? email,
    required String userId,
    String? name,
    String? userType,
  }) =>
      Future.wait([
        _secureStorage.write(key: _userIdKey, value: userId),
        if (email != null) _secureStorage.write(key: _emailKey, value: email),
        if (name != null) _secureStorage.write(key: _nameKey, value: name),
        if (userType != null) _secureStorage.write(key: _userTypeKey, value: userType)
      ]);

  Future<void> deleteUserInfo() => Future.wait([
        _secureStorage.delete(key: _userIdKey),
        _secureStorage.delete(key: _emailKey),
        _secureStorage.delete(key: _nameKey),
        _secureStorage.delete(key: _userTypeKey),
      ]);

  Future<String?> getUserId() => _secureStorage.read(key: _userIdKey);

  Future<String?> getUserEmail() => _secureStorage.read(key: _emailKey);

  Future<String?> getUserName() => _secureStorage.read(key: _nameKey);

  Future<String?> getUserType() => _secureStorage.read(key: _userTypeKey);
}
