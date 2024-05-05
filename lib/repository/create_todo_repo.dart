import 'package:flutter/foundation.dart';
import 'package:todo_app/bloc/todo_bloc.dart';
import 'package:todo_app/data/data_export.dart';

class CreateTodoRepo {
  final TodoBloc _todoBloc = TodoBloc();
  final TodoIsarDbModel _todoIsarDbModel = TodoIsarDbModel();

  Future<void> addTodoRepo(String? tFieldVal) async {
    try {
      _todoIsarDbModel.todoFieldValue = tFieldVal;
      String todo = _todoIsarDbModel.todoFieldValue!;
      await _todoBloc.addTodo(todo);
      debugPrint('todoVal: $todo');
    } on Exception catch (e) {
      debugPrint('add todo error: $e');
    }
  }
}
