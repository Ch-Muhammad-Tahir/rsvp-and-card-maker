import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rsvpandcardsmakerapp/utils/app_constants.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
      BuildContext context, ResponsiveContext responsiveContext) builder;
  final Map<DeviceType, DeviceConfig> deviceConfigs;
  final DeviceConfig? defaultDeviceConfig;

  const ResponsiveBuilder({
    super.key,
    required this.builder,
    required this.deviceConfigs,
    this.defaultDeviceConfig,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final responsiveContext = _getResponsiveContext(mediaQueryData);

    return builder(context, responsiveContext);
  }

  ResponsiveContext _getResponsiveContext(MediaQueryData mediaQueryData) {
    final screenSize = mediaQueryData.size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    final orientation = mediaQueryData.orientation;
    final deviceInfo = _getDeviceInfo(mediaQueryData);
    final deviceConfig = _getDeviceConfig(deviceInfo);
    final adjustedSize = _getAdjustedSize(
      screenSize,
      orientation,
      deviceInfo,
      deviceConfig,
    );

    return ResponsiveContext(
      screenSize: screenSize,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      orientation: orientation,
      deviceInfo: deviceInfo,
      adjustedSize: adjustedSize,
      deviceConfig: deviceConfig,
    );
  }

  DeviceInfo _getDeviceInfo(MediaQueryData mediaQueryData) {
    final deviceData = mediaQueryData.devicePixelRatio;
    final shortestSide = mediaQueryData.size.shortestSide;

    final DeviceType deviceType = deviceConfigs.keys.firstWhere(
      (type) =>
          shortestSide >= deviceConfigs[type]!.minWidth &&
          shortestSide < deviceConfigs[type]!.maxWidth,
      orElse: () => defaultDeviceConfig?.deviceType ?? DeviceType.mobile,
    );

    return DeviceInfo(
      devicePixelRatio: deviceData,
      deviceType: deviceType,
    );
  }

  DeviceConfig _getDeviceConfig(DeviceInfo deviceInfo) {
    return deviceConfigs[deviceInfo.deviceType] ??
        defaultDeviceConfig ??
        const DeviceConfig();
  }

  Size _getAdjustedSize(
    Size screenSize,
    Orientation orientation,
    DeviceInfo deviceInfo,
    DeviceConfig deviceConfig,
  ) {
    double adjustedWidth;
    double adjustedHeight;

    if (deviceInfo.deviceType == DeviceType.desktop) {
      adjustedWidth = screenSize.width;
      adjustedHeight = screenSize.height;
    } else {
      final adjustment = orientation == Orientation.landscape
          ? deviceConfig.landscapeAdjustment
          : deviceConfig.portraitAdjustment;
      adjustedWidth = screenSize.width / adjustment;
      adjustedHeight = screenSize.height / adjustment;
    }

    return Size(adjustedWidth, adjustedHeight);
  }
}

class DeviceInfo {
  final double devicePixelRatio;
  final DeviceType deviceType;

  DeviceInfo({
    required this.devicePixelRatio,
    required this.deviceType,
  });
}

class DeviceConfig {
  final double minWidth;
  final double maxWidth;
  final double portraitAdjustment;
  final double landscapeAdjustment;
  final DeviceType deviceType;

  const DeviceConfig({
    this.minWidth = 0,
    this.maxWidth = double.infinity,
    this.portraitAdjustment = 1,
    this.landscapeAdjustment = 1,
    this.deviceType = DeviceType.mobile,
  });
}

class ResponsiveContext {
  final Size screenSize;
  final double screenWidth;
  final double screenHeight;
  final Orientation orientation;
  final DeviceInfo deviceInfo;
  final Size adjustedSize;
  final DeviceConfig deviceConfig;

  ResponsiveContext({
    required this.screenSize,
    required this.screenWidth,
    required this.screenHeight,
    required this.orientation,
    required this.deviceInfo,
    required this.adjustedSize,
    required this.deviceConfig,
  });
}

enum DeviceType { mobile, tablet, desktop }
