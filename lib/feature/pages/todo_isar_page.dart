import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_isar_db/feature/cubit/isar/isar_cubit.dart';
import '../components/isar_list_component.dart';

class TodoIsarPage extends StatelessWidget {
  final Color? appBarColor;

  const TodoIsarPage({super.key, this.appBarColor});

  @override
  Widget build(BuildContext context) {
    return IsarListComponent(
      appBarColor: appBarColor,
      title: 'CRUD (ISAR)',
      addItem: (model) {
        context.read<IsarCubit>().addItemToList(model);
      },
      editItem: (model, index) {
        context.read<IsarCubit>().editItemToList(index, model);
      },
      deleteItem: (index, id) {
        context.read<IsarCubit>().deleteItemFromList(id);
      },
    );
  }
}
