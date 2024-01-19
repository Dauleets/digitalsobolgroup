abstract class PhotoStorage {
  Future<void> savePhotoPath(String? path);
  Future<String?> getPhotoPath();
}
