// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/todo/todo_view_export.dart';
import 'package:todo_app/utils/utils_export.dart';

import '../const/const_extention.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

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
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NoTodoBodyView(),
          ],
        ).padHorizontal(horizontal: 20).padVerticle(verticle: 20),
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
