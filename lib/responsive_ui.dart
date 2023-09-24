import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:provider/provider.dart';

import 'provider/theme_provider.dart';

class ResposiveBuilder extends StatelessWidget {
  ResposiveBuilder({
    super.key,
    required this.mobileBuilder,
    required this.tabletBuilder,
    required this.desktopBuilder,
  });

  final Widget Function(
    BuildContext context,
    BoxConstraints constraints,
  ) mobileBuilder;

  final Widget Function(
    BuildContext context,
    BoxConstraints constraints,
  ) tabletBuilder;

  final Widget Function(
    BuildContext context,
    BoxConstraints constraints,
  ) desktopBuilder;

  bool isMobile(BuildContext context) => MediaQuery.sizeOf(context).width < 600;
  bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 1100 &&
      MediaQuery.sizeOf(context).width >= 600;
  bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 1100;

  bool isPortTrait(BuildContext context) =>
      MediaQuery.orientationOf(context) == Orientation.portrait;

  String platform = '';

  @override
  Widget build(BuildContext context) {
    //Identify what platform are you using
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

        //add state for future used
        context
            .read<ThemeProvider>()
            .setPlatForm(platform, isPortTrait(context));

        //Identify which size for desktop, tablet and mobile
        if (constraints.maxWidth >= 1100) {
          return desktopBuilder(context, constraints);
        } else if (constraints.maxWidth >= 600) {
          return tabletBuilder(context, constraints);
        } else {
          return mobileBuilder(context, constraints);
        }
      },
    );
  }
}
