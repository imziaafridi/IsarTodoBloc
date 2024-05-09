// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/bloc/bloc_export.dart';
import 'package:todo_app/data/data_export.dart';
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

  final TextEditingController _tFieldVal = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    _tFieldVal.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final _todoConstruct = TodoConstruct();
    final Size mQuerySize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppPaint.WHITE,
        appBar: AppBar(
          title: Container(
            // margin: EdgeInsets.symmetric(vertical: 10),
            decoration: const BoxDecoration(
                border: Border.symmetric(
                    horizontal:
                        BorderSide(color: AppPaint.BLUE_DARK, width: .76))),
            child: Text(
              AppText.TODO,
              style: const TextStyle().appBarTextStyleExtenson,
            ),
          ),
          centerTitle: true,

          // border: Border.all(width: .2, color: AppPaint.BLACK),
          backgroundColor: AppPaint.WHITE,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(mQuerySize.height / 18),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: mQuerySize.height / 18,
                decoration: BoxDecoration(
                    color: AppPaint.GREY_LIGHT,
                    borderRadius: BorderRadius.circular(10)),
                child: TabBar(
                  indicatorColor: AppPaint.TRANSPARENT,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppPaint.YELLOW_LIGHT),
                  tabs: const [
                    LineDeorationText(
                      text: 'Pending Todo',
                      lineDecoreT: TextDecoration.none,
                    ),
                    LineDeorationText(
                      text: 'Done Todo',
                      lineDecoreT: TextDecoration.none,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            TodoPendingView(tFieldVal: _tFieldVal)
                .padOnly(left: 10, right: 10, top: 10, bottom: 0),
            // 2nd tab

            const DoneTasks(),
          ],
        ),

        // floating btn
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: AppPaint.BLUE_DARK,

          // save todo section
          onPressed: () {
            _tFieldVal.clear();
            showModelDraggableBSheet(
              context: context,
              child: CupertinoPopupDesign(
                tFieldVal: _tFieldVal,
                // onChanged: (p0) => _textEditingController.clear(),
                ontap: () =>
                    cupertinoPopupAddTodoFunctionality(context, _tFieldVal),
                editOnComplete: () => cupertinoPopupAddTodoFunctionality,
              ),
            );

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
      ),
    );
  }
}

class LineDeorationText extends StatelessWidget {
  const LineDeorationText({
    super.key,
    required this.text,
    required this.lineDecoreT,
  });
  final String text;
  final TextDecoration? lineDecoreT;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          decoration: lineDecoreT,
          fontSize: Theme.of(context).textTheme.titleMedium!.fontSize),
    );
  }
}

class DoneTasks extends StatelessWidget {
  const DoneTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteBloc, NoteState>(
      builder: (context, state) {
        var todo = state.todo;
        return ListView.builder(
          itemCount: state.todo!.length,
          itemBuilder: (context, index) {
            if (todo![index].isTodoDone == true) {
              return Container(
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
              );
            } else {
              return const SizedBox(
                width: 0,
                height: 0,
              );
            }
          },
        );
      },
    );
  }
}

class TodoPendingView extends StatelessWidget {
  TodoPendingView({
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
                    key: Key(todo![index].todoFieldValue!),
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
          return const NoTodoBodyView();
        }
      },
    );
  }

  List<TodoIsarDbModel> _todos = [];
}
