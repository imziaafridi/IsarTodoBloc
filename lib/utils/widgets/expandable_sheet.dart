// import 'package:flutter/cupertino.dart';

// class ExpandableDraggableSheet extends StatefulWidget {
//   final Widget child;
//   final double initialHeight;
//   final double minHeight;
//   final double maxHeight;

//   const ExpandableDraggableSheet({
//     Key? key,
//     required this.child,
//     this.initialHeight = 0.5,
//     this.minHeight = 0.2,
//     this.maxHeight = 1.0,
//   }) : super(key: key);

//   @override
//   _ExpandableDraggableSheetState createState() =>
//       _ExpandableDraggableSheetState();
// }

// class _ExpandableDraggableSheetState extends State<ExpandableDraggableSheet> {
//   double _currentHeight = 0.5;

//   void _handleDragUpdate(DragUpdateDetails details) {
//     setState(() {
//       _currentHeight += details.delta.dy / MediaQuery.of(context).size.height;
//       _currentHeight = _currentHeight.clamp(widget.minHeight, widget.maxHeight);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onVerticalDragUpdate: _handleDragUpdate,
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 200),
//         height: MediaQuery.of(context).size.height * _currentHeight,
//         child: widget.child,
//       ),
//     );
//   }
// }
