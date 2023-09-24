import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data_class/temp_class.dart';
import '../../provider/theme_provider.dart';

class MobilePage extends StatefulWidget {
  const MobilePage({super.key});

  @override
  State<MobilePage> createState() => _MobilePageState();
}

class _MobilePageState extends State<MobilePage> {
  @override
  Widget build(BuildContext context) {
    final platForm = context.select((ThemeProvider p) => p.platform);
    bool isPortrait = context.select((ThemeProvider p) => p.isPortrait);

    final isDarkModePro = context.select((ThemeProvider p) => p.isDarkTheme);
    bool isMobile = MediaQuery.sizeOf(context).shortestSide < 600;

    print(isPortrait);

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Mobile $platForm'),
              Switch.adaptive(
                value: isDarkModePro,
                onChanged: (value) {
                  setState(() {
                    isDarkModePro == true
                        ? context.read<ThemeProvider>().setDarkTheme(false)
                        : context.read<ThemeProvider>().setDarkTheme(true);
                  });
                },
              )
            ],
          ),
        ),
      ),
      drawer: isMobile
          ? Drawer(
              child: Container(
                color: Colors.blue,
                child: const Center(
                  child: Text('Side bar'),
                ),
              ),
            )
          : null,
      body: Row(
        children: [
          if (!isMobile)
            Container(
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
  }
}
