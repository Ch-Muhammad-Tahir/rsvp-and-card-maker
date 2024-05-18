import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rsvpandcardsmakerapp/common_widgets/custom_appbar.dart';
import 'package:rsvpandcardsmakerapp/common_widgets/responsive_builder.dart';
import 'package:rsvpandcardsmakerapp/presentation/card_design/riverpods/card_design_provider.dart';
import 'package:rsvpandcardsmakerapp/utils/app_constants.dart';
import 'package:rsvpandcardsmakerapp/utils/color_constant.dart';
import 'package:rsvpandcardsmakerapp/utils/extensions.dart';
import 'package:rsvpandcardsmakerapp/utils/print_logs.dart';

import 'widgets/car_design_bottom_nav_bar.dart';
import 'widgets/drage_able_widget.dart';

class CardDesiginScreen extends ConsumerWidget {
  const CardDesiginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var canvasWidgets = ref.watch(cardDesignProvider);
    return ResponsiveBuilder(
      deviceConfigs: AppConstants.deviceConfigs,
      builder: (contex, responsiveContext) {
        final screenWidth = responsiveContext.screenWidth;
        return Scaffold(
          appBar: MyAppBar(title: "Card Design Screen"),
          floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                ref
                    .read(cardDesignProvider.notifier)
                    .addWidgetInCanvas(text: "Add me");
              },
              label: const Row(
                children: [Icon(Icons.add), Text("Add")],
              )),
          body: Column(
            children: [
              GestureDetector(
                onTap: () {
                  ref.read(cardDesignProvider.notifier).unSelecteWidget();
                  PrintLogs.printLogs("1234567");
                },
                child: Container(
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
                        BoxShadow(
                            blurRadius: 10, color: ColorConstant.lightGrey)
                      ]),
                  child: Stack(
                    children: [
                      for (var canvasWidget in canvasWidgets)
                        CustomDraggableWidget(
                          object: canvasWidget,
                          onTap: () {
                            ref
                                .read(cardDesignProvider.notifier)
                                .selectWidgetInCanvas(
                                    uniqueId: canvasWidget.uniqueId);
                          },
                          onPositionUpdated: (top, left) {
                            ref
                                .read(cardDesignProvider.notifier)
                                .changeWidgetPosition(canvasWidget,
                                    top.toString(), left.toString());
                          },
                        )
                    ],
                  ),
                ),
              ).paddingAll(screenWidth * 0.06)
            ],
          ),
          bottomNavigationBar: const CardDesingBottomNavBar(),
        );
      },
    );
  }
}
