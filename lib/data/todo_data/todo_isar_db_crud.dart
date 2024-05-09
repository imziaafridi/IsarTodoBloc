import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/data/model/todo_isar_db_model.dart';

class TodoIsarDbCrud {
  static late Isar isar;

  static Future<void> initIsarDb() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [TodoIsarDbModelSchema],
      directory: dir.path,
    );
  }

// create todo
  Future<void> createTodo(TodoIsarDbModel todo) async {
    // final todo = TodoIsarDbModel()..todoFieldValue = value;
    await isar.writeTxn(
      () async => await isar.todoIsarDbModels.put(todo),
    );
  }

  // read todo

  // List<TodoIsarDbModel> currentTodo = [];
  Future<List<TodoIsarDbModel>> readTodo() async {
    // final todoCollection = isar.collection<TodoIsarDbModel>();
    var fetchTodo = await isar.todoIsarDbModels.where().findAll();
    return fetchTodo;
    // currentTodo.clear();
    // currentTodo.addAll(fetchTodo);
  }

  // edit value
  Future<void> updateTodo(int id, String todo) async {
    final existingTodo = await isar.todoIsarDbModels.get(id);
    if (existingTodo != null) {
      existingTodo.todoFieldValue = todo;
    }
    await isar.writeTxn(
      () async => await isar.todoIsarDbModels.put(existingTodo!),
    );
  }

  // delete
  Future<bool> deleteTodo(int id) async {
    bool d = await isar.writeTxn(
      () async => await isar.todoIsarDbModels.delete(id),
    );
    // bool d = await isar.todoIsarDbModels.delete(id);
    return d;
  }

  // // updateCheckbox vl
  Future<void> updateTodoChecker(TodoIsarDbModel todo) async {
    final existingTodo = await isar.todoIsarDbModels.get(todo.id);
    if (existingTodo != null) {
      existingTodo.isTodoDone = todo.isTodoDone;
    }
    await isar.writeTxn(
      () async => await isar.todoIsarDbModels.put(existingTodo!),
    );
  }
}// class closed !
