import 'package:flutter/material.dart';
import 'responsive_ui.dart';
import 'ui/desktop/desktop.dart';
import 'ui/mobile/mobile.dart';
import 'ui/tablet/tablet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ResposiveBuilder(
      desktopBuilder: (context, constraints) {
        return const DesktopPage();
      },
      tabletBuilder: (context, constraints) {
        return const TabletPage();
      },
      mobileBuilder: (context, constraints) {
        return const MobilePage();
      },
    );
  }
}
