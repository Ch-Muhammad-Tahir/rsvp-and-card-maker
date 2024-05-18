import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rsvpandcardsmakerapp/domain/card_desing_model/canvas_widget_object.dart';

class CardDesignStateNotifier extends StateNotifier<List<CanvasWidgetObject>> {
  bool iselected = false;
  CardDesignStateNotifier()
      : super([CanvasWidgetObject.add(text: "Hello World1")]);
  void addWidgetInCanvas({required String text}) {
    state = [...state, CanvasWidgetObject.add(text: text)];
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

  void changeFontSize({required String uniqueId, required String fontSize}) {
    state = state.map((obj) {
      if (uniqueId == obj.uniqueId) {
        obj.fontSize = fontSize;
      }
      return obj;
    }).toList();
  }

  void selectWidgetInCanvas({required String uniqueId}) {
    state = state.map((obj) {
      if (obj.uniqueId == uniqueId) {
        return obj.copyWith(isSelected: true);
      } else {
        return obj.copyWith(isSelected: false);
      }
    }).toList();
  }

  void unSelecteWidget() {
    iselected = false;
    state = state.map((obj) {
      if (obj.isSelected) {
        return obj.copyWith(isSelected: false);
      } else {
        return obj;
      }
    }).toList();
  }
}
