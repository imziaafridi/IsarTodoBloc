part of 'note_bloc.dart';

class NoteState extends Equatable {
  NoteState({this.todo});
  List<TodoIsarDbModel>? todo;

  NoteState copyWith(List<TodoIsarDbModel>? todo) {
    return NoteState(todo: todo ?? this.todo);
  }

  @override
  List<Object> get props => [todo!];
}

class TodoLoadingState extends NoteState {
  TodoLoadingState();
}

class TodoDoneState extends NoteState {
  TodoDoneState(List<TodoIsarDbModel> todo) : super(todo: todo);
}
