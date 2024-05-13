import '../common_widgets/responsive_builder.dart';

class AppConstants {
  static Map<DeviceType, DeviceConfig> deviceConfigs = {
    DeviceType.mobile: AppConstants.kMobileConfig,
    DeviceType.tablet: AppConstants.kTabletConfig,
    DeviceType.desktop: AppConstants.kDesktopConfig,
  };
  static const kMobileConfig = DeviceConfig(
    minWidth: 0,
    maxWidth: 480,
    portraitAdjustment: 1,
    landscapeAdjustment: 1.5,
    deviceType: DeviceType.mobile,
  );

  static const kTabletConfig = DeviceConfig(
    minWidth: 481,
    maxWidth: 900,
    portraitAdjustment: 1.5,
    landscapeAdjustment: 2,
    deviceType: DeviceType.tablet,
  );

  static const kDesktopConfig = DeviceConfig(
    minWidth: 901,
    maxWidth: double.infinity,
    portraitAdjustment: 1,
    landscapeAdjustment: 1,
    deviceType: DeviceType.desktop,
  );
}
