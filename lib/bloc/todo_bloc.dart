// // streams

// import 'dart:async';
// import '../data/data_export.dart';

// class TodoBloc {
//   // final TodoIsarDbModel _todoIsarDbModel = TodoIsarDbModel();
//   final TodoIsarDbCrud _todoIsarDb = TodoIsarDbCrud();

//   StreamController<TodoIsarDbModel> _todoController =
//       StreamController<TodoIsarDbModel>();

//   Stream<TodoIsarDbModel> get todoStream => _todoController.stream;

//   Future<void> addTodo(String todo) async {
//     await _todoIsarDb.createTodo(todo);
//   }

//   Future<dynamic> get disposeTodo => _todoController.close();
//   final todoBloc = TodoBloc(); // making singleton instance of TodoBloc class.
// }// todoBloc class end .
