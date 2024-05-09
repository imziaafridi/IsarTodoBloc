import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/bloc_export.dart';
import 'package:todo_app/const/const_extention.dart';
import 'package:todo_app/data/model/todo_isar_db_model.dart';
import 'package:todo_app/utils/utils_export.dart';

class CupertinoPopupDesign extends StatelessWidget {
  CupertinoPopupDesign({
    super.key,
    this.tFieldVal,
    required this.ontap,
    this.onChanged,
    this.label,
    this.editOnComplete,
  });

  final TextEditingController? tFieldVal;
  final void Function()? ontap;
  final String? label;
  void Function(String)? onChanged;
  void Function()? editOnComplete;

  @override
  Widget build(BuildContext context) {
    // double mQueryH = MediaQuery.of(context).size.height;
    // int _minLen = 1;
    // int _maxLen = 4;
    return Container(
      // height: mQueryH / 4

      // MediaQuery.of(context).size.height -
      //     MediaQuery.of(context).viewInsets.bottom -
      //     kToolbarHeight

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
            controller: tFieldVal,
            placeholder: AppText.ADD_TODO,
            minLines: 1,
            maxLines: 3,
            // maxLength: 25,
            onChanged: onChanged ?? (value) {},
            onEditingComplete: editOnComplete ?? () {},
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
                ontap: ontap ?? () {},
                label: label ?? AppText.ADD_TODO,
              )
            ],
          ).padHorizontal(horizontal: 20),
        ],
      ),
    );
  }
}
