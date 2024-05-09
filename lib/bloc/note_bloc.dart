import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_app/data/data_export.dart';
import 'package:todo_app/data/model/todo_isar_db_model.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc()
      : super(
          TodoLoadingState(),
        ) {
    on<CreateTodoEvent>(_createTodoMethod);
    on<FetchTodoEvent>(_fetchTodoMethod);
    on<UpdateTodoEvent>(_updateTodoMethod);
    on<DeleteTodoEvent>(_removeTodoMethod);
    on<UpdateTodoCheckerEvent>(_checkTodoMethod);
  }

  final TodoIsarDbCrud _todoIsarDbCrud = TodoIsarDbCrud();

  // add method
  void _createTodoMethod(
      CreateTodoEvent addEvent, Emitter<NoteState> emit) async {
    try {
      await _todoIsarDbCrud.createTodo(addEvent.todo!);
      List<TodoIsarDbModel> todoList = await _todoIsarDbCrud.readTodo();
      emit(
        TodoDoneState(todo: todoList),
      );
    } on Exception catch (e) {
      debugPrint('error: $e');
    }
  }

  // final List<TodoIsarDbModel> currentTodo = [];

  // read method
  void _fetchTodoMethod(
      FetchTodoEvent readEvent, Emitter<NoteState> emit) async {
    try {
      List<TodoIsarDbModel> todoList = await _todoIsarDbCrud.readTodo();
      emit(
        TodoDoneState(todo: todoList),
      );
    } on Exception catch (e) {
      debugPrint('error: $e');
    }
  }

  // modification method
  void _updateTodoMethod(
      UpdateTodoEvent modificationEvent, Emitter<NoteState> emit) async {
    try {
      await _todoIsarDbCrud.updateTodo(
          modificationEvent.todo!.id, modificationEvent.todo!.todoFieldValue!);
      List<TodoIsarDbModel> todoList = await _todoIsarDbCrud.readTodo();
      emit(
        TodoDoneState(todo: todoList),
      );
      debugPrint(
          "UPDATE_TODO -> id: ${modificationEvent.todo!.id} , value: ${modificationEvent.todo!.todoFieldValue} ");
    } on Exception catch (e) {
      debugPrint('error: $e');
    }
  }

  //remove method
  void _removeTodoMethod(
      DeleteTodoEvent removeEvent, Emitter<NoteState> emit) async {
    try {
      await _todoIsarDbCrud.deleteTodo(removeEvent.todo!.id);
      List<TodoIsarDbModel> todoList = await _todoIsarDbCrud.readTodo();
      emit(
        TodoDoneState(todo: todoList),
      );
    } on Exception catch (e) {
      debugPrint('error: $e');
    }
  }

  void _checkTodoMethod(
      UpdateTodoCheckerEvent todoCheckerEvent, Emitter<NoteState> emit) async {
    // todo[index].isTodoDone = currentBoolVal!;
    try {
      await _todoIsarDbCrud.updateTodoChecker(todoCheckerEvent.todo!);
      List<TodoIsarDbModel> todoList = await _todoIsarDbCrud.readTodo();
      emit(
        TodoDoneState(todo: todoList),
      );
    } on Exception catch (e) {
      debugPrint('error: $e');
    }
  }
} // class end !
