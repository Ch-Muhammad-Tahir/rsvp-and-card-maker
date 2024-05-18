import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rsvpandcardsmakerapp/presentation/card_design/riverpods/card_design_state_notifier.dart';

import '../../../domain/card_desing_model/canvas_widget_object.dart';

var cardDesignProvider =
    StateNotifierProvider<CardDesignStateNotifier, List<CanvasWidgetObject>>(
        (ref) {
  return CardDesignStateNotifier();
});
