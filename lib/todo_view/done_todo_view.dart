import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/bloc_export.dart';
import 'package:todo_app/const/const_extention.dart';
import 'package:todo_app/data/data_export.dart';
import 'package:todo_app/utils/utils_export.dart';

class DoneTodoView extends StatelessWidget {
  const DoneTodoView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteBloc, NoteState>(
      builder: (context, state) {
        List<TodoIsarDbModel>? todo = state.todo;
        // Check for empty list before building ListView
        // var b = todo!.every((element) => element.isTodoDone);

        if (state is TodoLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (todo!.isNotEmpty) {
          return ListView.builder(
            itemCount: state.todo!.length,
            itemBuilder: (context, index) {
              if (todo[index].isTodoDone == true) {
                return Dismissible(
                  key: Key(todo[index].todoFieldValue!),
                  direction: DismissDirection.down,
                  background: const Icon(
                    CupertinoIcons.delete,
                    color: AppPaint.RED_DARK,
                  ),
                  secondaryBackground: const Icon(
                    CupertinoIcons.minus,
                    color: AppPaint.BLUE_DARK,
                  ),
                  onDismissed: (d) {
                    // delete functionality
                    context.read<NoteBloc>().add(
                          DeleteTodoEvent(
                            todo[index],
                          ),
                        );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Todo is deleted successfully"),
                      ),
                    );
                  },
                  child: Container(
                    color: todo[index].isTodoDone == true
                        ? AppPaint.GREY_LIGHT
                        : AppPaint.TRANSPARENT,
                    // margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),

                      // CHECK BOX

                      leading: SizedBox(
                          width: 20,
                          child: Checkbox(
                              value: todo[index].isTodoDone,
                              onChanged: (currentBoolVal) {
                                // todo[index].isTodoDone = currentBoolVal!;
                                TodoIsarDbModel todoEvent = TodoIsarDbModel()
                                  ..id = todo[index].id
                                  ..isTodoDone = currentBoolVal!;
                                context.read<NoteBloc>().add(
                                      UpdateTodoCheckerEvent(todoEvent),
                                    );
                              })),
                      title: Text(
                        todo[index].todoFieldValue!,
                        style: TextStyle(
                            decoration: todo[index].isTodoDone == true
                                ? TextDecoration.lineThrough
                                : TextDecoration.none),
                      ),
                      // subtitle: Text(
                      //   'id: ${todo[index].id}',
                      //   style: Theme.of(context).textTheme.bodySmall,
                      // ),
                    ),
                  ).padOnly(left: 10, right: 10, top: 10, bottom: 0),
                );
              } else {
                return Container();
              }
            },
          );
        } else {
          return Center(
            child: Image.asset(
              'assets/icons/done_todo.png',
              height: 200,
              // fit: BoxFit.contain,
            ),
          );
        }
      },
    );
  }
}
