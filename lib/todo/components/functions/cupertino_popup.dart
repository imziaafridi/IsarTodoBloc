import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void cupertinoPopup({required Widget child, BuildContext? context}) {
  showCupertinoModalPopup(context: context!, builder: (context) => child);
}

void showModelDraggableBSheet(
    {required BuildContext context, required Widget child}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // set this to true
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        // snap: true,
        // controller: DraggableScrollableController(),
        shouldCloseOnMinExtent: false,
        snapAnimationDuration: Durations.extralong1,
        builder: (context, scrollController) => child,
      );
    },
  );
}
