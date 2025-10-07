import 'dart:convert';
import 'dart:developer' as logger;

import 'package:ecommerce_app/features/auth/data/model/user_model.dart';
import 'package:ecommerce_app/features/auth/domain/entity/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  // Variabel static untuk menyimpan instans tunggal
  static final SecureStorage _instance = SecureStorage._internal();

  // Factory constructor yang mengembalikan instans yang sama
  factory SecureStorage() {
    return _instance;
  }

  // Private constructor
  SecureStorage._internal();

  static const _storage = FlutterSecureStorage();

  // Keys ---->>>>>>
  static const String _keyUser = 'user';

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
        preferencesKeyPrefix: 'tumbas',
        sharedPreferencesName: 'e-commerce-tumbas',
      );

  /// [setUserModel] menyimpan data User.
  Future<void> setUserModel(User userData) async {
    await _storage
        .write(
            key: _keyUser,
            value: json.encode(userData.toJson()),
            aOptions: _getAndroidOptions())
        .onError((error, stackTrace) {
      if (kDebugMode) {
        logger.log(
            'TEAM_SECURE_STORAGE: ERROR setUserModel => $error\nSTACKTRACE:$stackTrace');
      }
    }).then((value) {
      if (kDebugMode) {
        logger.log('TEAM_SECURE_STORAGE: setUserModel selesai');
      }
    });
  }

  /// [getUser] mengambil data user dari Persistent Data.
  Future<User?> getUser() async {
    try {
      final user = await _storage.read(
        key: _keyUser,
        aOptions: _getAndroidOptions(),
      );

      if (user?.isEmpty == true) {
        throw 'Data not found';
      }

      return UserModel.fromJson(json.decode(user!));
    } catch (e) {
      if (kDebugMode) {
        logger.log('TEAM_SECURE_STORAGE-GetUser: ERROR >> $e');
      }
      return null;
    }
  }

  Future<void> logout() async {
    _storage.delete(key: _keyUser, aOptions: _getAndroidOptions());
  }
}
