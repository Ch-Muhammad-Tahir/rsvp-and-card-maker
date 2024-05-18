// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:rsvpandcardsmakerapp/utils/helper_function.dart';

class CanvasWidgetObject {
  String uniqueId = "";
  String top = "";
  String left = "";
  String text = "";
  String fontSize = "";
  String fontFamliy = "";
  String color = "";
  bool isSelected = false;
  CanvasWidgetObject.init();
  CanvasWidgetObject({
    required this.uniqueId,
    required this.top,
    required this.left,
    required this.text,
    required this.fontSize,
    required this.fontFamliy,
    required this.color,
    required this.isSelected,
  });
  CanvasWidgetObject.add({required this.text}) {
    top = '100';
    left = '200';
    fontSize = '70';
    color = "#000000";
    uniqueId = HelperFunction.generateUniqueKey();
  }

  CanvasWidgetObject copyWith({
    String? uniqueId,
    String? top,
    String? left,
    String? text,
    String? fontSize,
    String? fontFamliy,
    String? color,
    bool? isSelected,
  }) {
    return CanvasWidgetObject(
      uniqueId: uniqueId ?? this.uniqueId,
      top: top ?? this.top,
      left: left ?? this.left,
      text: text ?? this.text,
      fontSize: fontSize ?? this.fontSize,
      fontFamliy: fontFamliy ?? this.fontFamliy,
      color: color ?? this.color,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uniqueId': uniqueId,
      'top': top,
      'left': left,
      'text': text,
      'fontSize': fontSize,
      'fontFamliy': fontFamliy,
      'color': color,
      'iselected': isSelected,
    };
  }

  factory CanvasWidgetObject.fromMap(Map<String, dynamic> map) {
    return CanvasWidgetObject(
      uniqueId: map['uniqueId'] as String,
      top: map['top'] as String,
      left: map['left'] as String,
      text: map['text'] as String,
      fontSize: map['fontSize'] as String,
      fontFamliy: map['fontFamliy'] as String,
      color: map['color'] as String,
      isSelected: map['isSelected'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory CanvasWidgetObject.fromJson(String source) =>
      CanvasWidgetObject.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CanvasWidgetObject(uniqueId: $uniqueId, top: $top, left: $left, text: $text, fontSize: $fontSize, fontFamliy: $fontFamliy, color: $color, isSelected: $isSelected)';
  }

  @override
  bool operator ==(covariant CanvasWidgetObject other) {
    if (identical(this, other)) return true;

    return other.uniqueId == uniqueId &&
        other.top == top &&
        other.left == left &&
        other.text == text &&
        other.fontSize == fontSize &&
        other.fontFamliy == fontFamliy &&
        other.color == color &&
        other.isSelected == isSelected;
  }

  @override
  int get hashCode {
    return uniqueId.hashCode ^
        top.hashCode ^
        left.hashCode ^
        text.hashCode ^
        fontSize.hashCode ^
        fontFamliy.hashCode ^
        color.hashCode ^
        isSelected.hashCode;
  }
}
