import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/bloc_export.dart';
import 'package:todo_app/const/const_extention.dart';
import 'package:todo_app/data/model/todo_isar_db_model.dart';
import 'package:todo_app/repository/create_todo_repo.dart';
import 'package:todo_app/utils/utils_export.dart';

class TodoConstruct {
  final TextEditingController _textEditingController = TextEditingController();
  final TodoIsarDbModel _todoIsarDbModel = TodoIsarDbModel();

  void createTodoCupertinoModelSheet(BuildContext context) =>
      showCupertinoModalPopup(
        context: context,
        builder: (context) => Container(
          height: 200
          // MediaQuery.of(context).size.height -
          //     MediaQuery.of(context).viewInsets.bottom -
          //     kToolbarHeight
          ,
          decoration: const BoxDecoration(
            color: AppPaint.WHITE,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              6.ph,
              Container(
                width: 60,
                height: 6,
                decoration: BoxDecoration(
                  color: AppPaint.GREY_LIGHT,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              60.ph,
              CupertinoTextField(
                controller: _textEditingController,
                placeholder: AppText.ADD_TODO,
              ).padHorizontal(horizontal: 20),
              20.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomSecondryButton(
                    ontap: () {
                      Navigator.pop(context);
                      debugPrint('CHECK CALL FOR CANCEL !');
                    },
                    label: AppText.CANCEL,
                    color: AppPaint.RED_DARK,
                  ),
                  CustomSecondryButton(
                    ontap: () {
                      // add data to variable
                      TodoIsarDbModel todo = TodoIsarDbModel()
                        ..todoFieldValue = _textEditingController.text;
                      // store data
                      context.read<NoteBloc>().add(CreateTodoEvent(todo));
                      // after store data then exite.
                      debugPrint(
                          'todoDB-> id: ${todo.id}, todoFieldValue: ${todo.todoFieldValue}');
                      debugPrint('CHECK CALL FOR ADD TODO !');
                    },
                    label: AppText.ADD_TODO,
                  )
                ],
              ).padHorizontal(horizontal: 20),
            ],
          ),
        ),
      );
}
