import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data_class/temp_class.dart';
import '../provider/theme_provider.dart';

class TabletPage extends StatefulWidget {
  String platform;
  bool isPortrait;
  TabletPage({super.key, required this.isPortrait, required this.platform});

  @override
  State<TabletPage> createState() => _TabletPageState();
}

class _TabletPageState extends State<TabletPage> {
  @override
  Widget build(BuildContext context) {
    bool isPortrait = widget.isPortrait;
    String platform = widget.platform;
    // bool isMobile = MediaQuery.sizeOf(context).shortestSide < 600;

    print('Portrait:$isPortrait');

    return Consumer<ThemeProvider>(
      builder: (context, value, child) {
        bool isDarkTheme = value.isDarkTheme;
        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Tablet'),
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
                  width: 200,
                  color: Colors.blue,
                  child: const Center(
                    child: Text('Side bar'),
                  )),
              Expanded(
                child: GridView.count(
                  crossAxisCount: isPortrait ? 2 : 3,
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
          // body: ListView.separated(
          //   itemCount: 25,
          //   separatorBuilder: (BuildContext context, int index) => const Divider(),
          //   itemBuilder: (BuildContext context, int index) {
          //     return ListTile(
          //       title: Text('item $index'),
          //     );
          //   },
          // ),
        );
      },
    );
  }
}
