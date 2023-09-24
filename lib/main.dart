import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_page.dart';
import 'provider/theme_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) {
        return MaterialApp(
          title: 'Responsive',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomePage(),
          darkTheme: value.isDarkTheme ? ThemeData.dark() : ThemeData.light(),
          themeMode: value.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
        );
      },
    );
  }
}
