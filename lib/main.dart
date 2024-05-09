import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/bloc_export.dart';
import 'package:todo_app/const/const_extention.dart';
import 'package:todo_app/data/todo_data/todo_isar_db_crud.dart';
import 'package:todo_app/todo/todo_view_export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TodoIsarDbCrud.initIsarDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your applications.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NoteBloc>(
      create: (context) => NoteBloc(),
      child: MaterialApp(
        title: AppText.TODO,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TodoScreen(),
      ),
    );
  }
}

// class PendingTasks extends StatelessWidget {
//   const PendingTasks({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

// class DoneTasks extends StatelessWidget {
//   const DoneTasks({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
