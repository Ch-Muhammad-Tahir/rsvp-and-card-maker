// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CanvasWidgetObject {
  String uniqueId = "";
  String top = "";
  String left = "";
  String text = "";
  String fontSize = "";
  String fontFamliy = "";
  String color = "";
  CanvasWidgetObject.init();
  CanvasWidgetObject({
    required this.uniqueId,
    required this.top,
    required this.left,
    required this.fontSize,
    required this.fontFamliy,
    required this.color,
  });
  CanvasWidgetObject.add({required this.text}) {
    top = '100';
    left = '200';
    fontSize = '70';
    color = "#ffffff";
  }

  CanvasWidgetObject copyWith({
    String? uniqueId,
    String? top,
    String? left,
    String? fontSize,
    String? fontFamliy,
    String? color,
  }) {
    return CanvasWidgetObject(
      uniqueId: uniqueId ?? this.uniqueId,
      top: top ?? this.top,
      left: left ?? this.left,
      fontSize: fontSize ?? this.fontSize,
      fontFamliy: fontFamliy ?? this.fontFamliy,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'unique_id': uniqueId,
      'top': top,
      'left': left,
      'font_size': fontSize,
      'font_famliy': fontFamliy,
      'color': color,
    };
  }

  factory CanvasWidgetObject.fromMap(Map<String, dynamic> map) {
    return CanvasWidgetObject(
      uniqueId: map['unique_id'] as String,
      top: map['top'] as String,
      left: map['left'] as String,
      fontSize: map['font_size'] as String,
      fontFamliy: map['font_famliy'] as String,
      color: map['color'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CanvasWidgetObject.fromJson(String source) =>
      CanvasWidgetObject.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CanvasWidgetObject(unique_id: $uniqueId, top: $top, left: $left, font_size: $fontSize, font_famliy: $fontFamliy, color: $color)';
  }

  @override
  bool operator ==(covariant CanvasWidgetObject other) {
    if (identical(this, other)) return true;

    return other.uniqueId == uniqueId &&
        other.top == top &&
        other.left == left &&
        other.fontSize == fontSize &&
        other.fontFamliy == fontFamliy &&
        other.color == color;
  }

  @override
  int get hashCode {
    return uniqueId.hashCode ^
        top.hashCode ^
        left.hashCode ^
        fontSize.hashCode ^
        fontFamliy.hashCode ^
        color.hashCode;
  }
}
