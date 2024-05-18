import 'package:flutter/material.dart';
import 'package:rsvpandcardsmakerapp/utils/color_constant.dart';
import '../../../domain/card_desing_model/canvas_widget_object.dart';

class CustomDraggableWidget extends StatefulWidget {
  final CanvasWidgetObject object;
  final Function(double top, double left) onPositionUpdated;
  final VoidCallback onTap;

  const CustomDraggableWidget({
    super.key,
    required this.object,
    required this.onPositionUpdated,
    required this.onTap,
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
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: widget.object.isSelected
                ? Border.all(color: Colors.black)
                : null,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Draggable(
            onDragUpdate: _handleDragUpdate,
            feedback: Container(),
            child: Text(
              widget.object.text,
              style: TextStyle(
                fontSize: double.tryParse(widget.object.fontSize) ?? 40,
                color: HexColor(widget.object.color),
              ),
            ),
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
