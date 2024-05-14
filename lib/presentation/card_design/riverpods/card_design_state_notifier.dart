import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rsvpandcardsmakerapp/domain/card_desing_model/canvas_widget_object.dart';

class CardDesignStateNotifier extends StateNotifier<List<CanvasWidgetObject>> {
  CardDesignStateNotifier()
      : super([CanvasWidgetObject.add(text: "Hello World1")]);
  void addWidgetInCanvas({required String text}) {
    state = [...state, CanvasWidgetObject.add(text: "Hello World")];
  }

  void changeWidgetPosition(
      CanvasWidgetObject object, String top, String left) {
    state = state.map((obj) {
      if (object.uniqueId == obj.uniqueId) {
        obj.left = left;
        obj.top = top;
      }
      return obj;
    }).toList();
  }
}
