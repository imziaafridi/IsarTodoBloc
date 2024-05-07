import 'package:flutter/material.dart';
import 'package:todo_app/const/const_extention.dart';
import 'package:todo_app/utils/utils_export.dart';

class CustomSecondryButton extends StatelessWidget {
  const CustomSecondryButton(
      {super.key, this.ontap, required this.label, this.color});
  final void Function()? ontap;
  final String? label;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: ontap ??
            () {
              debugPrint('check call');
            },
        child: SizedBox(
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: color ?? AppPaint.BLUE_DARK,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              label ?? AppText.ADD_TODO,
              style: const TextStyle().buttonMainTextStyleExtension,
            ),
          ),
        ),
      ),
    );
  }
}
