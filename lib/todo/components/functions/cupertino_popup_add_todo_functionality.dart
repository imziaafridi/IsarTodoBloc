// save todo method
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/data_export.dart';

import '../../../bloc/bloc_export.dart';

void cupertinoPopupAddTodoFunctionality(
    BuildContext context, TextEditingController tFieldVal) {
  // add data to variable
  TodoIsarDbModel todo = TodoIsarDbModel()..todoFieldValue = tFieldVal.text;
  // store data
  context.read<NoteBloc>().add(CreateTodoEvent(todo));
  // after store data then exite.
  Navigator.pop(context);
  tFieldVal.clear();

  debugPrint('todoDB-> id: ${todo.id}, todoFieldValue: ${todo.todoFieldValue}');
  debugPrint('CHECK CALL FOR ADD TODO !');
}
