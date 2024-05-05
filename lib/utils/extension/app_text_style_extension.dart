import 'package:flutter/cupertino.dart';
import 'package:todo_app/const/app_font.dart';
import 'package:todo_app/const/app_paint.dart';

//textStyle for app level usage
extension AppTextStyleExtension on TextStyle {
  // static const String POPPINS_FONTS = 'Poppins';
  // static const Color BLACK = Color(0xFF000000);

  // Method with default arguments
  TextStyle applyStyleBaseExtension({
    String fontFamily = AppFont.POPPINS_FONTS,
    double fontSize = 16.0,
    FontWeight fontWeight = FontWeight.normal,
    Color color = AppPaint.BLACK,
    TextDecoration textDecoration = TextDecoration.none,
    Color decorationColor = AppPaint.BLACK,
  }) {
    return copyWith(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      decoration: textDecoration,
      decorationColor: decorationColor,
    );
  }

  // Specific styles
  TextStyle get appBarTextStyleExtenson => applyStyleBaseExtension(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
      );

  TextStyle get bodyTextStyleExtension =>
      applyStyleBaseExtension(fontSize: 16.0, fontWeight: FontWeight.w400);

  TextStyle get bodyLightTextStyleExtension => applyStyleBaseExtension(
      fontSize: 16.0, fontWeight: FontWeight.w300, color: AppPaint.GREY);

  TextStyle get bodyMulishTextStyleExtension => applyStyleBaseExtension(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: AppPaint.BLACK,
      fontFamily: AppFont.MULISH_FONT);

  TextStyle get buttonMainTextStyleExtension => applyStyleBaseExtension(
      fontSize: 16.0,
      fontWeight: FontWeight.w300,
      fontFamily: AppFont.MULISH_FONT,
      color: AppPaint.WHITE,
      textDecoration: TextDecoration.lineThrough,
      decorationColor: AppPaint.WHITE);

  TextStyle get buttonSubTextStyleExtension => applyStyleBaseExtension(
      fontSize: 16.0,
      fontWeight: FontWeight.w300,
      color: AppPaint.BLUE_DARK,
      textDecoration: TextDecoration.underline,
      decorationColor: AppPaint.GREY);
}//class end

// Usage: (More flexible)
// Text(
//   'This uses app bar style with custom color',
//   style: TextStyle().applyStyle(color: Colors.blue),
// );

// Text(
//   'This uses body style',
//   style: TextStyle().bodyTextStyle(),
// );
