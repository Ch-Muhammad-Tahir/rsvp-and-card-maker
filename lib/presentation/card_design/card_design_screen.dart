import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rsvpandcardsmakerapp/common_widgets/custom_appbar.dart';
import 'package:rsvpandcardsmakerapp/common_widgets/responsive_builder.dart';
import 'package:rsvpandcardsmakerapp/presentation/card_design/riverpods/card_design_provider.dart';
import 'package:rsvpandcardsmakerapp/utils/app_constants.dart';
import 'package:rsvpandcardsmakerapp/utils/color_constant.dart';
import 'package:rsvpandcardsmakerapp/utils/extensions.dart';
import 'dart:ui' as ui;
import 'dart:io';
import 'widgets/drage_able_widget.dart';

class CardDesiginScreen extends ConsumerWidget {
  const CardDesiginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var canvasWidgets = ref.watch(cardDesignProvder);
    return ResponsiveBuilder(
      deviceConfigs: AppConstants.deviceConfigs,
      builder: (contex, responsiveContext) {
        final screenWidth = responsiveContext.screenWidth;
        return Scaffold(
          appBar: MyAppBar(title: "Card Design Screen"),
          body: Column(
            children: [
              Container(
                height: screenWidth * 1.3,
                width: screenWidth * 1,
                decoration: BoxDecoration(
                    color: ColorConstant.cyan,
                    shape: BoxShape.rectangle,
                    image: const DecorationImage(
                        image: AssetImage(
                            'assets/background_templates/background_1.png'),
                        fit: BoxFit.cover),
                    boxShadow: [
                      BoxShadow(blurRadius: 10, color: ColorConstant.lightGrey)
                    ]),
                child: Stack(
                  children: [
                    for (var canvasWidget in canvasWidgets)
                      CustomDraggableWidget(
                        object: canvasWidget,
                        onPositionUpdated: (top, left) {
                          ref
                              .read(cardDesignProvder.notifier)
                              .changeWidgetPosition(canvasWidget,
                                  top.toString(), left.toString());
                        },
                      )
                  ],
                ),
              ).paddingAll(screenWidth * 0.06)
            ],
          ),
        );
      },
    );
  }
}
