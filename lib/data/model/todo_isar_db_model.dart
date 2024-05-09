import 'package:isar/isar.dart';

part 'todo_isar_db_model.g.dart';

@collection
class TodoIsarDbModel {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  String? todoFieldValue;

  bool isTodoDone = false;
}
