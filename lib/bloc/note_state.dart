part of 'note_bloc.dart';

class NoteState extends Equatable {
  NoteState({
    this.todo,
  });
  List<TodoIsarDbModel>? todo;

  NoteState copyWith({List<TodoIsarDbModel>? todo, bool? isTodoDone}) {
    return NoteState(
      todo: todo ?? this.todo,
    );
  }

  @override
  List<Object> get props => [
        todo!,
      ];
}

class TodoLoadingState extends NoteState {
  TodoLoadingState();
}

class TodoDoneState extends NoteState {
  TodoDoneState({
    required List<TodoIsarDbModel> todo,
  }) : super(
          todo: todo,
        );
}

// class TodoDoneChecker extends NoteState {
//   TodoDoneChecker(bool isTodoDone) : super(isTodoDone: isTodoDone);
// }
