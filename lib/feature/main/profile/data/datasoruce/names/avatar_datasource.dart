abstract class NamesStorage {
  Future<void> saveNameUser(String? path);
  Future<String?> getNameUser();
  Future<void> saveFemaleUser(String? path);
  Future<String?> getFemaleUser();
}
