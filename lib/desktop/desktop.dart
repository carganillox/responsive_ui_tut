import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutresponsive/provider/theme_provider.dart';

import '../data_class/temp_class.dart';

class DesktopPage extends StatefulWidget {
  String platform;
  bool isPortrait;
  DesktopPage({super.key, required this.isPortrait, required this.platform});

  @override
  State<DesktopPage> createState() => _DesktopPageState();
}

class _DesktopPageState extends State<DesktopPage> {
  @override
  Widget build(BuildContext context) {
    bool isPortrait = widget.isPortrait;
    String platform = widget.platform;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.sizeOf(context).height;

    return Consumer<ThemeProvider>(
      builder: (context, value, child) {
        bool isDarkTheme = value.isDarkTheme;
        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Web'),
                  Switch.adaptive(
                    value: isDarkTheme,
                    onChanged: (value) {
                      setState(() {
                        isDarkTheme
                            ? context.read<ThemeProvider>().setDarkTheme(false)
                            : context.read<ThemeProvider>().setDarkTheme(true);
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          body: Row(
            children: [
              Container(
                  width: 300,
                  color: Colors.blue,
                  child: const Center(
                    child: Text('Side bar'),
                  )),
              Expanded(
                child: GridView.count(
                  crossAxisCount: isPortrait ? 5 : 10,
                  children: List.generate(
                      str.length,
                      (index) => Card(
                            color: Colors.green,
                            child: Center(child: Text(str[index])),
                          )),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
