import 'package:flutter/material.dart';
import 'package:rsvpandcardsmakerapp/common_widgets/custom_appbar.dart';
import 'package:rsvpandcardsmakerapp/common_widgets/responsive_builder.dart';
import 'package:rsvpandcardsmakerapp/utils/app_constants.dart';
import 'package:rsvpandcardsmakerapp/utils/color_constant.dart';
import 'package:rsvpandcardsmakerapp/utils/extensions.dart';

class CardDesiginScreen extends StatefulWidget {
  const CardDesiginScreen({super.key});

  @override
  State<CardDesiginScreen> createState() => _CardDesiginScreenState();
}

class _CardDesiginScreenState extends State<CardDesiginScreen> {
  @override
  Widget build(BuildContext context) {
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
                    // border: Border.all(color: ColorConstant.cyan, width: 0.2),
                    shape: BoxShape.rectangle,
                    boxShadow: [
                      BoxShadow(blurRadius: 5, color: ColorConstant.lightGrey)
                    ]),
                child: Stack(
                  children: [],
                ),
              ).paddingAll(screenWidth * 0.06)
            ],
          ),
        );
      },
    );
  }
}
