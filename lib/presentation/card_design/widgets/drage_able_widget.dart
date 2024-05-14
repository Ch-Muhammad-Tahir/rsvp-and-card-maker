import 'package:flutter/material.dart';
import '../../../domain/card_desing_model/canvas_widget_object.dart';

class CustomDraggableWidget extends StatefulWidget {
  final CanvasWidgetObject object;
  final Function(double top, double left) onPositionUpdated;

  const CustomDraggableWidget({
    super.key,
    required this.object,
    required this.onPositionUpdated,
  });

  @override
  State<CustomDraggableWidget> createState() => _CustomDraggableWidgetState();
}

class _CustomDraggableWidgetState extends State<CustomDraggableWidget> {
  late double _top;
  late double _left;

  @override
  void initState() {
    super.initState();
    _top = double.tryParse(widget.object.top) ?? 0;
    _left = double.tryParse(widget.object.left) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _top,
      left: _left,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Draggable(
            onDragUpdate: _handleDragUpdate,
            feedback: Container(),
            child: Text(widget.object.text),
          ),
        ),
      ),
    );
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    final newTop = _top + details.delta.dy;
    final newLeft = _left + details.delta.dx;

    if (newTop < 535 && newTop >= -15) {
      _top = newTop;
    }

    if (newLeft < 300 && newLeft >= -15) {
      _left = newLeft;
    }

    widget.onPositionUpdated(_top, _left);
  }
}
