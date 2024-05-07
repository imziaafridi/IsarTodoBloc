// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/bloc_export.dart';
import 'package:todo_app/todo/todo_view_export.dart';
import 'package:todo_app/utils/utils_export.dart';

import '../const/const_extention.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NoteBloc>().add(
          FetchTodoEvent(),
        );
  }

  @override
  Widget build(BuildContext context) {
    final _todoConstruct = TodoConstruct();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppPaint.WHITE,
      appBar: CupertinoNavigationBar(
        middle: Text(
          AppText.TODO,
          style: const TextStyle().appBarTextStyleExtenson,
        ).padTop(pad: 20),
        border: Border.all(width: 0, color: AppPaint.TRANSPARENT),
        backgroundColor: AppPaint.WHITE,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: BlocBuilder<NoteBloc, NoteState>(
          builder: (context, state) {
            // var  s= state.todo;

            return state is TodoLoadingState
                ? const CircularProgressIndicator()
                : Column(
                    children: state.todo!
                        .asMap()
                        .entries
                        .map(
                          (todo) => Dismissible(
                            key: Key(todo.value.todoFieldValue!),
                            onDismissed: (direction) {
                              context
                                  .read<NoteBloc>()
                                  .add(DeleteTodoEvent(todo.value));
                            },
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Text(todo.value.id.toString()),
                              ),
                              title: Text(todo.value.todoFieldValue!),
                              // subtitle: ,
                              trailing: SizedBox(
                                child: CustomSecondryButton(
                                  label: 'Edit',
                                  ontap: () {},
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ).padHorizontal(horizontal: 20);
          },
        ),
      ),
      // floating btn
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppPaint.BLUE_DARK,
        onPressed: () {
          _todoConstruct.createTodoCupertinoModelSheet(context);
          debugPrint(AppText.SAVE_TODO);
        },
        label: Row(
          children: [
            const Icon(
              CupertinoIcons.add,
              color: AppPaint.WHITE,
            ),
            10.pw,
            Text(
              AppText.ADD_TODO,
              style: const TextStyle().buttonMainTextStyleExtension,
            ),
          ],
        ),
      ).padRight(pad: 10),
    );
  }
}
