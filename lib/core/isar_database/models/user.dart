import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class User {
  Id? id = Isar.autoIncrement;

  String firstName;

  String lastName;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  User({this.id = Isar.autoIncrement, this.lastName = '', this.firstName = ''});
}
