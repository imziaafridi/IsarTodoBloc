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

  // final todo = isar.todoIsarDbModels;

// create todo
  Future<void> createTodo(String value) async {
    final todo = TodoIsarDbModel()..todoFieldValue = value;
    await isar.writeTxn(
      () async => await isar.todoIsarDbModels.put(todo),
    );
    await readTodo();
  }

  // read todo
  final List<TodoIsarDbModel> currentTodo = [];
  Future<void> readTodo() async {
    // final todoCollection = isar.collection<TodoIsarDbModel>();
    final fetchTodo = await isar.todoIsarDbModels.where().findAll();
    currentTodo.clear();
    currentTodo.addAll(fetchTodo);
  }
  // update

  Future<void> updateTodo(int id, String todo) async {
    final existingTodo = await isar.todoIsarDbModels.get(id);
    if (existingTodo != null) {
      existingTodo.todoFieldValue = todo;
    }
    await isar.writeTxn(
      () async => await isar.todoIsarDbModels.put(existingTodo!),
    );
    await readTodo();

    // delete
    Future<void> deleteTodo(int id) async {
      await isar.todoIsarDbModels.delete(id);
    }
  }
}
