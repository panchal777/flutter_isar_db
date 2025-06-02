import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'models/user.dart';

Future<Isar?> openDB() async {
  var dir = await getApplicationDocumentsDirectory();
  // to get application directory information

  if (Isar.instanceNames.isEmpty) {
    return await Isar.open(
      //open isar
      [UserSchema],
      //user.g.dart includes the schemes that we need to define here - it can be single or multiple.
      directory: dir.path,
    );
  }

  return Isar.getInstance();
  // return instance of Isar - it makes the isar state Ready for Usage for adding/deleting operations.
}
