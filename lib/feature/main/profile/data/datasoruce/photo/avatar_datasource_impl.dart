import 'package:digitalsobolgroup/common/types/failures.dart';
import 'package:digitalsobolgroup/feature/main/profile/data/datasoruce/photo/avatar_datasource.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PhotoStorageImpl implements PhotoStorage {
  static const String photoKey = 'photo_path';

  @override
  Future<void> savePhotoPath(String? path) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (path != null) {
        prefs.setString(photoKey, path);
      } else {
        prefs.remove(photoKey);
      }
    } catch (exception) {
      if (kDebugMode) {
        print('Error saving photo path: $exception');
      }
      throw InvalidDataFailure(message: 'Error saving photo path');
    }
  }

  @override
  Future<String?> getPhotoPath() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(photoKey);
    } catch (exception) {
      if (kDebugMode) {
        print('Error get photo path: $exception');
      }
      throw InvalidDataFailure(message: 'Error get photo path');
    }
  }
}
