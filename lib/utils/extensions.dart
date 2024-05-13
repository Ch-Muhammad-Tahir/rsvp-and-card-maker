import 'package:flutter/material.dart';

/// Extension methods for adding padding to any widget in a Flutter application.
extension PaddingExtension on Widget {
  /// Adds uniform padding to all sides of the widget.
  Widget paddingAll(double padding) {
    assert(padding >= 0.0, 'Padding value must be non-negative.');
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }

  /// Adds symmetrical padding to the horizontal sides of the widget.
  Widget paddingHorizontal(double horizontalPadding) {
    assert(horizontalPadding >= 0.0, 'Padding value must be non-negative.');
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: this,
    );
  }

  /// Adds symmetrical padding to the vertical sides of the widget.
  Widget paddingVertical(double verticalPadding) {
    assert(verticalPadding >= 0.0, 'Padding value must be non-negative.');
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: this,
    );
  }

  /// Adds padding specifically to the left side of the widget.
  Widget paddingLeft(double leftPadding) {
    assert(leftPadding >= 0.0, 'Padding value must be non-negative.');
    return Padding(
      padding: EdgeInsets.only(left: leftPadding),
      child: this,
    );
  }

  /// Adds padding specifically to the right side of the widget.
  Widget paddingRight(double rightPadding) {
    assert(rightPadding >= 0.0, 'Padding value must be non-negative.');
    return Padding(
      padding: EdgeInsets.only(right: rightPadding),
      child: this,
    );
  }

  /// Adds padding specifically to the top side of the widget.
  Widget paddingTop(double topPadding) {
    assert(topPadding >= 0.0, 'Padding value must be non-negative.');
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: this,
    );
  }

  /// Adds padding specifically to the bottom side of the widget.
  Widget paddingBottom(double bottomPadding) {
    assert(bottomPadding >= 0.0, 'Padding value must be non-negative.');
    return Padding(
      padding: EdgeInsets.all(bottomPadding),
      child: this,
    );
  }
}
