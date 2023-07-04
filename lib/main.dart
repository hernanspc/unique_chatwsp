import 'package:flutter/material.dart';
import 'package:unique_chatwsp/common/theme/dark_theme.dart';
import 'package:unique_chatwsp/common/theme/light_theme.dart';
import 'package:unique_chatwsp/feature/welcome/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhassApp Mee',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      home: const WelcomePage(),
    );
  }
}
