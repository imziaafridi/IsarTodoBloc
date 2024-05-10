import 'package:flutter/cupertino.dart';
import 'package:todo_app/const/app_paint.dart';
import 'package:todo_app/const/app_text.dart';
import 'package:todo_app/utils/extension/app_sized_box_extension.dart';
import 'package:todo_app/utils/extension/app_text_style_extension.dart';

class AppBarLogo extends StatelessWidget {
  const AppBarLogo({
    super.key,
    required this.mQuerySize,
    this.image,
    this.text,
    this.border,
  });

  final Size mQuerySize;
  final String? image;
  final String? text;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          // margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              border: border ??
                  const Border.symmetric(
                      horizontal:
                          BorderSide(color: AppPaint.BLUE_DARK, width: .76))),
          child: Text(
            text ?? AppText.TODO,
            style: const TextStyle().appBarTextStyleExtenson,
          ),
        ),
        4.pw,
        Image.asset(
          image ?? 'assets/icons/todo-logo-01.png',
          height: mQuerySize.height / 26,
        ),
      ],
    );
  }
}
