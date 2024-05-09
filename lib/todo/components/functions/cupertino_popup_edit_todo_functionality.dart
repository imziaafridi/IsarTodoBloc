// edit todo method
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/data_export.dart';

import '../../../bloc/bloc_export.dart';

void cupertinoPopupEditTodoFunctionality(BuildContext context,
    TodoIsarDbModel todo, TextEditingController tFieldVal) {
  TodoIsarDbModel todoModel = TodoIsarDbModel()
    ..todoFieldValue = tFieldVal.text
    ..id = todo.id;
  // update data
  context.read<NoteBloc>().add(
        UpdateTodoEvent(todoModel),
      );

  // after store data then exite.

  Navigator.pop(context);

  debugPrint(
      'Updtae-> id: ${todoModel.id}, todoFieldValue: ${todoModel.todoFieldValue}');
  debugPrint('CHECK CALL FOR ADD TODO !');
} //