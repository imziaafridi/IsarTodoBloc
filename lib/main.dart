import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
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
        debugShowCheckedModeBanner: false,
        title: AppText.TODO,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {PointerDeviceKind.mouse},
        ),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TodoScreen(),
      ),
    );
  }
}





// hello, im creating beautiful custom tab bar for you. so lets start.
























// class PendingTasks extends StatelessWidget {
//   const PendingTasks({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }


