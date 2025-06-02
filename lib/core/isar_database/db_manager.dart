import 'package:isar/isar.dart';
import 'app_initializer.dart';

class DBManager {
  static Isar? _database;

  DBManager._privateConstructor();

  static final DBManager instance = DBManager._privateConstructor();

  Future<Isar> getDbInstance() async {
    if (_database == null) {
      _database = await openDB();
      return _database!;
    } else {
      return _database!;
    }
  }
}
