import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ResposiveBuilder extends StatelessWidget {
  ResposiveBuilder({
    super.key,
    required this.mobileBuilder,
    required this.tabletBuilder,
    required this.desktopBuilder,
  });

  final Widget Function(BuildContext context, BoxConstraints constraints,
      String platform, bool portrait) mobileBuilder;

  final Widget Function(BuildContext context, BoxConstraints constraints,
      String platform, bool portrait) tabletBuilder;

  final Widget Function(BuildContext context, BoxConstraints constraints,
      String platform, bool portrait) desktopBuilder;

  bool isMobile(BuildContext context) => MediaQuery.sizeOf(context).width < 600;
  bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 1100 &&
      MediaQuery.sizeOf(context).width >= 600;
  bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 1100;

  bool isDesktopPortrait(BuildContext context) =>
      MediaQuery.orientationOf(context) == Orientation.portrait;
  bool isMobilePortrait(BuildContext context) =>
      MediaQuery.orientationOf(context) == Orientation.portrait;
  bool isTabletPortrait(BuildContext context) =>
      MediaQuery.orientationOf(context) == Orientation.portrait;

  String platform = '';

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      // Web-specific code
      platform = 'web';
    } else if (Platform.isAndroid) {
      // Android-specific code
      platform = 'android';
    } else if (Platform.isIOS) {
      // iOS-specific code
      platform = 'ios';
    } else if (Platform.isFuchsia) {
      // Fuchsia-specific code
      platform = 'funchsia';
    } else if (Platform.isLinux) {
      // Linux-specific code
      platform = 'linux';
    } else if (Platform.isWindows) {
      // Windows-specific code
      platform = 'windows';
    } else if (Platform.isMacOS) {
      // macOS-specific code
      platform = 'macos';
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        double screenHeight = MediaQuery.sizeOf(context).height;
        double screenWidth = MediaQuery.sizeOf(context).height;

        if (constraints.maxWidth >= 1100) {
          return desktopBuilder(
              context, constraints, platform, isDesktopPortrait(context));
        } else if (constraints.maxWidth >= 600) {
          return tabletBuilder(
              context, constraints, platform, isMobilePortrait(context));
        } else {
          return mobileBuilder(
              context, constraints, platform, isMobilePortrait(context));
        }
      },
    );
  }
}
