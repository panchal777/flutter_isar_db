import '../../core/isar_database/models/user.dart';

abstract class UserRepository {
  Future<List<User>> saveUser(User newModel);

  Future<List<User>> getAllUser();

  Future<List<User>> updateUser(User user);

  Future<List<User>> deleteUser(int userId);
}
