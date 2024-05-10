import 'package:flutter/cupertino.dart';
import 'package:todo_app/const/app_paint.dart';
import 'package:todo_app/todo_view/components/linear_decor_text.dart';

class CustomTabsBDesgn extends StatelessWidget {
  const CustomTabsBDesgn({
    super.key,
    required this.value,
    this.icon,
    this.image,
    this.picHt = 24,
  });

  final String? value;
  final IconData? icon;
  final String? image;
  final double? picHt;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        LineDecorText(
          text: value ?? 'Pending Todo',
          lineDecoreT: TextDecoration.none,
        ),
        if (image != null)
          Image.asset(
            image!,
            height: image != null ? picHt : 0,
            color: AppPaint.GREY_LIGHT,
          )
        else
          Icon(
            icon,
            size: icon != null ? picHt : 0,
            color: AppPaint.GREY_LIGHT,
          ),
      ],
    );
  }
}
