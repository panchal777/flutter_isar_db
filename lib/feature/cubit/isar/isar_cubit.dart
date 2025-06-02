import 'package:flutter_bloc/flutter_bloc.dart';
import 'isar_states.dart';

class IsarCubit extends Cubit<IsarStates> {
  final String successMsg = 'List fetched successfully';
  final String addSuccessMsg = 'User added successfully';
  final String editSuccessMsg = 'User edited successfully';
  final String deleteSuccessMsg = 'User deleted successfully';

  IsarCubit() : super(StateInitial());

  getUserList() async {
    emit(StateLoading());
    var userList = [];
    emit(
      SuccessState(
        msg: successMsg,
        userList: userList,
        type: SuccessEnum.fetch,
      ),
    );
  }

  addItemToList() async {}

  editItemToList(int index) async {}

  deleteItemFromList(int id) async {}
}
