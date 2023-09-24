import 'package:flutter/material.dart';

import 'desktop/desktop.dart';
import 'mobile/mobile.dart';
import 'responsive_ui.dart';
import 'tablet/tablet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ResposiveBuilder(
      desktopBuilder: (context, constraints, platform, portrait) {
        return DesktopPage(
          isPortrait: portrait,
          platform: platform,
        );
      },
      tabletBuilder: (context, constraints, platform, portrait) {
        return TabletPage(
          isPortrait: portrait,
          platform: platform,
        );
      },
      mobileBuilder: (context, constraints, platform, portrait) {
        return MobilePage(
          isPortrait: portrait,
          platform: platform,
        );
      },
    );
  }
}