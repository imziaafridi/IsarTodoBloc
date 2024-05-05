import 'package:todo_app/data/model/todo_isar_db_model.dart';

abstract class TodoEvent {
  final TodoIsarDbModel todoIsarDbModel;
  TodoEvent(this.todoIsarDbModel);
}

class TodoCreateEvent extends TodoEvent {
  TodoCreateEvent(super.todoIsarDbModel);
}
