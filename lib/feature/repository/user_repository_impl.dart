import 'package:flutter_isar_db/core/isar_database/models/user.dart';
import 'package:flutter_isar_db/feature/repository/user_repository.dart';
import 'package:isar/isar.dart';

import '../../core/isar_database/db_manager.dart';

class UserRepositoryImpl extends UserRepository {
  late Isar isar;

  UserRepositoryImpl() {
    initializeDB();
  }

  initializeDB() async {
    isar = await DBManager.instance.getDbInstance();
  }

  @override
  Future<List<User>> saveUser(User newUser) async {
    await initializeDB();
    //Perform a synchronous write transaction to add the user to the database.
    isar.writeTxnSync(() => isar.users.putSync(newUser));
    return await getAllUser();
  }

  //Retrieve all users from the Isar database.
  @override
  Future<List<User>> getAllUser() async {
    await initializeDB();
    //Find all users in the user collection and return the list.
    return await isar.users.where().findAll();
  }

  @override
  // Update an existing user in the Isar database.
  Future<List<User>> updateUser(User user) async {
    await initializeDB();
    await isar.writeTxn(() async {
      //Perform a write transaction to update the user in the database.
      await isar.users.put(user);
    });
    return await getAllUser();
  }

  //Delete a user from the Isar database based on user ID.
  @override
  Future<List<User>> deleteUser(int userid) async {
    await initializeDB();
    var lastList = await getAllUser();
    //Perform a write transaction to delete the user with the specified ID.
    isar.writeTxnSync(() => isar.users.deleteSync(userid));
    return await getAllUser();
  }
}
