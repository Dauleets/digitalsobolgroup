import 'package:digitalsobolgroup/common/types/failures.dart';
import 'package:digitalsobolgroup/feature/main/profile/data/datasoruce/names/avatar_datasource.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NamesStorageImpl implements NamesStorage {
  static const String nameKey = 'name';
  static const String femaleKey = 'female';

  @override
  Future<void> saveNameUser(String? path) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (path != null) {
        prefs.setString(nameKey, path);
      } else {
        prefs.remove(nameKey);
      }
    } catch (exception) {
      if (kDebugMode) {
        print('Error saving photo path: $exception');
      }
      throw InvalidDataFailure(message: 'Error saving photo path');
    }
  }

  @override
  Future<String?> getNameUser() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(nameKey);
    } catch (exception) {
      if (kDebugMode) {
        print('Error get photo path: $exception');
      }
      throw InvalidDataFailure(message: 'Error get photo path');
    }
  }

  @override
  Future<void> saveFemaleUser(String? path) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (path != null) {
        prefs.setString(femaleKey, path);
      } else {
        prefs.remove(femaleKey);
      }
    } catch (exception) {
      if (kDebugMode) {
        print('Error saving photo path: $exception');
      }
      throw InvalidDataFailure(message: 'Error saving photo path');
    }
  }

  @override
  Future<String?> getFemaleUser() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      return prefs.getString(femaleKey);
    } catch (exception) {
      if (kDebugMode) {
        print('Error get photo path: $exception');
      }
      throw InvalidDataFailure(message: 'Error get photo path');
    }
  }
}
