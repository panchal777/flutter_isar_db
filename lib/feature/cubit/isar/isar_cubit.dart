import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_isar_db/core/isar_database/models/user.dart';
import 'package:flutter_isar_db/feature/repository/user_repository.dart';
import 'package:flutter_isar_db/feature/repository/user_repository_impl.dart';
import 'isar_states.dart';

class IsarCubit extends Cubit<IsarStates> {
  final UserRepository _repository = UserRepositoryImpl();

  List<User> userList = [];

  final String successMsg = 'List fetched successfully';
  final String addSuccessMsg = 'User added successfully';
  final String editSuccessMsg = 'User edited successfully';
  final String deleteSuccessMsg = 'User deleted successfully';

  IsarCubit() : super(StateInitial());

  getAllUsers() async {
    emit(StateLoading());
    userList = await _repository.getAllUser();
    emit(
      SuccessState(
        msg: successMsg,
        userList: userList,
        type: SuccessEnum.fetch,
      ),
    );
  }

  addItemToList(User model) async {
    userList = await _repository.saveUser(model);
    emit(
      SuccessState(
        msg: addSuccessMsg,
        userList: userList,
        type: SuccessEnum.add,
      ),
    );
  }

  editItemToList(int index, User model) async {
    userList = await _repository.updateUser(model);
    emit(
      SuccessState(
        msg: editSuccessMsg,
        userList: userList,
        type: SuccessEnum.edit,
      ),
    );
  }

  deleteItemFromList(int id) async {
    userList = await _repository.deleteUser(id);
    emit(
      SuccessState(
        msg: deleteSuccessMsg,
        userList: userList,
        type: SuccessEnum.delete,
      ),
    );
  }
}
