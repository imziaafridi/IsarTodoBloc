// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/bloc_export.dart';
import 'package:todo_app/todo_view/todo_view_export.dart';
import 'package:todo_app/utils/utils_export.dart';
import '../const/const_extention.dart';
import 'components/custom_tab_bar_design.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NoteBloc>().add(
          FetchTodoEvent(),
        );
    // todo done task widget clc
  }

  final TextEditingController _tFieldVal = TextEditingController();
  @override
  void dispose() {
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
          title: AppBarLogo(
            mQuerySize: mQuerySize,
            image: 'assets/icons/todo-logo-01.png',
          ),
          centerTitle: true,
          backgroundColor: AppPaint.WHITE,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(mQuerySize.height / 18),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: mQuerySize.height / 18,
                decoration: BoxDecoration(
                  // color: Color.fromRGBO(0, 0, 0, 0.345),
                  gradient: const LinearGradient(
                      colors: [AppPaint.PURPLE_LIGHT, AppPaint.AMBER_LIGHT],
                      begin: Alignment.centerLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TabBar(
                  unselectedLabelColor: AppPaint.GREY_LIGHT,
                  unselectedLabelStyle:
                      const TextStyle().bodyMulishTextStyleExtension,
                  dividerColor: AppPaint.TRANSPARENT,
                  labelColor: AppPaint.YELLOW_LIGHT,
                  labelStyle: const TextStyle().bodyTextStyleExtension,
                  labelPadding: const EdgeInsets.all(8),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(colors: [
                      AppPaint.BLUE_LIGHT,
                      AppPaint.RED_MODERATE_LIGHT,
                    ], begin: Alignment.centerLeft, end: Alignment.bottomRight),
                  ),
                  tabs: const [
                    CustomTabsBDesgn(
                      value: 'Pending Todo',
                      icon: Icons.pending,
                      // picHt: ,
                    ),
                    CustomTabsBDesgn(
                      value: 'Done Todo',
                      image: 'assets/icons/done_todo.png',
                      picHt: 28,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            // 1st tab
            PendingTodoView(tFieldVal: _tFieldVal)
                .padOnly(left: 10, right: 10, top: 10, bottom: 0),

            // 2nd tab
            const DoneTodoView(),
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
