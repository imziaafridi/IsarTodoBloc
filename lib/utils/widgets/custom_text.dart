import 'package:flutter/material.dart';
import 'package:todo_app/utils/utils_export.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text, this.textStyle});
  final String text;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle ?? const TextStyle().bodyMulishTextStyleExtension,
    );
  }
}
