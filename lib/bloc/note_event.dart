// ignore_for_file: must_be_immutable

part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  NoteEvent({this.todo, this.isTodoDone = false});
  TodoIsarDbModel? todo;
  bool isTodoDone;

  @override
  List<Object> get props => [todo!];
}

// add
class CreateTodoEvent extends NoteEvent {
  CreateTodoEvent(TodoIsarDbModel todo) : super(todo: todo);
}

// read
class FetchTodoEvent extends NoteEvent {
  FetchTodoEvent();
}

// modify
class UpdateTodoEvent extends NoteEvent {
  UpdateTodoEvent(TodoIsarDbModel todo) : super(todo: todo);
}

// remove
class DeleteTodoEvent extends NoteEvent {
  DeleteTodoEvent(TodoIsarDbModel todo) : super(todo: todo);
}

// is todo done or not bool val

class UpdateTodoCheckerEvent extends NoteEvent {
  UpdateTodoCheckerEvent(TodoIsarDbModel todo) : super(todo: todo);
}
