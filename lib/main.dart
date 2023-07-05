import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unique_chatwsp/common/theme/dark_theme.dart';
import 'package:unique_chatwsp/common/theme/light_theme.dart';
import 'package:unique_chatwsp/feature/auth/pages/login_page.dart';
import 'package:unique_chatwsp/feature/auth/pages/user_info_page.dart';
import 'package:unique_chatwsp/feature/auth/pages/verification_page.dart';
import 'package:unique_chatwsp/feature/welcome/pages/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'common/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhassAppMe',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      home: const WelcomePage(),
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
