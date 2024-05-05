import 'package:flutter/cupertino.dart';

extension AppPaddingExtension on Widget {
  Padding padAll({required double pad}) {
    return Padding(
      padding: EdgeInsets.all(pad),
      child: this,
    );
  }

  Padding padHorizontal({
    required double horizontal,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal,
      ),
      child: this,
    );
  }

  Padding padVerticle({required double verticle}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticle),
      child: this,
    );
  }

  Widget padLeft({required double pad}) {
    return Padding(
      padding: EdgeInsets.only(left: pad),
      child: this,
    );
  }

  Widget padRight({required double pad}) {
    return Padding(
      padding: EdgeInsets.only(right: pad),
      child: this,
    );
  }

  Padding padTop({required double pad}) {
    return Padding(
      padding: EdgeInsets.only(top: pad),
      child: this,
    );
  }

  Padding padBottom({required double pad}) {
    return Padding(
      padding: EdgeInsets.only(bottom: pad),
      child: this,
    );
  }

  Padding padOnly({
    required double left,
    required double right,
    required double top,
    required double bottom,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        right: right,
        top: top,
        bottom: bottom,
      ),
      child: this,
    );
  }
}
