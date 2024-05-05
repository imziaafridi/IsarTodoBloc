import 'package:flutter/cupertino.dart';

extension AppSizedBoxExtenion on num {
  SizedBox _sizBx({double w = 0.0, double h = 0.0}) {
    return SizedBox(
      width: w,
      height: h,
    );
  }

  SizedBox get pw => _sizBx(w: toDouble());
  SizedBox get ph => _sizBx(h: toDouble());
}
