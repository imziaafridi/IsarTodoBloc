// ignore_for_file: must_be_immutable

part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  NoteEvent({this.todo});
  TodoIsarDbModel? todo;

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
