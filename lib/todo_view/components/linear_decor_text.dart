import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/utils/extension/app_text_style_extension.dart';

class LineDecorText extends StatelessWidget {
  const LineDecorText({
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
      ).bodyTextStyleExtension,
    );
  }
}
