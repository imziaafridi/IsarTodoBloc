import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/bloc/bloc_export.dart';
import 'package:todo_app/const/const_extention.dart';
import 'package:todo_app/data/data_export.dart';
import 'package:todo_app/todo_view/todo_view_export.dart';
import 'package:todo_app/utils/utils_export.dart';

class PendingTodoView extends StatelessWidget {
  PendingTodoView({
    super.key,
    required TextEditingController tFieldVal,
  }) : _tFieldVal = tFieldVal;

  final TextEditingController _tFieldVal;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteBloc, NoteState>(
      builder: (context, state) {
        // var  s= state.todo;
        if (state is TodoLoadingState) {
          return const CircularProgressIndicator();
        } else if (state.todo!.isNotEmpty) {
          return ListView.builder(
            itemCount: state.todo!.length,
            itemBuilder: (BuildContext ctx, index) {
              List<TodoIsarDbModel>? todo = state.todo;
              if (todo![index].isTodoDone == false ||
                  todo[index].isTodoDone == null) {
                return Slidable(
                  startActionPane: ActionPane(
                    key: Key(todo[index].todoFieldValue!),
                    // dismissible: DismissiblePane(onDismissed: () {
                    //   // dismissed

                    // }),
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        backgroundColor: AppPaint.BLUE_DARK,
                        foregroundColor: Colors.white,
                        icon: CupertinoIcons.pencil_circle,
                        label: AppText.EDIT_TODO,
                        onPressed: (context) {
                          // edit funtionality
                          // pre tFieldVal
                          _tFieldVal.text = todo[index].todoFieldValue!;
                          //after
                          showModelDraggableBSheet(
                            context: ctx,
                            child: CupertinoPopupDesign(
                              tFieldVal: _tFieldVal,

                              // edit btn
                              ontap: () {
                                cupertinoPopupEditTodoFunctionality(
                                    ctx, todo[index], _tFieldVal);
                              },
                              // editOnComplete: () =>
                              //     cupertinoPopupEditTodoFunctionality,
                              // // field onchaged method here

                              label: AppText.EDIT_TODO,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        // flex: 4,
                        backgroundColor: AppPaint.RED_DARK,
                        foregroundColor: Colors.white,
                        icon: CupertinoIcons.delete,
                        label: AppText.DELETE_TODO,
                        onPressed: (context) {
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
                      ),
                    ],
                  ),
                  child: Container(
                    color: todo[index].isTodoDone == true
                        ? AppPaint.GREY_LIGHT
                        : AppPaint.YELLOW_LIGHT,
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

                                // debugPrint(
                                //     'todos: {todo[index].isTodoDone = checkTodo!}');
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
                  ),
                ).padBottom(pad: 10);
              } else {
                return const SizedBox(
                  width: 0,
                  height: 0,
                );
              }
            },
          );
        } else {
          return Center(
            child: Image.asset('assets/icons/add-todo.jpg'),
          );
        }
      },
    );
  }
}
