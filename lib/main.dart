import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unique_chatwsp/common/routes/routes.dart';
import 'package:unique_chatwsp/common/theme/dark_theme.dart';
import 'package:unique_chatwsp/common/theme/light_theme.dart';
import 'package:unique_chatwsp/feature/auth/controller/auth_controller.dart';
import 'package:unique_chatwsp/feature/contact/pages/contact_page.dart';
import 'package:unique_chatwsp/feature/home/pages/home_page.dart';
import 'package:unique_chatwsp/feature/welcome/pages/welcome_page.dart';
import 'package:unique_chatwsp/firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhassAppMe',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      home: ref.watch(userInfoAuthProvider).when(
            data: (user) {
              FlutterNativeSplash.remove();
              if (user == null) return const WelcomePage();
              return const HomePage();
            },
            error: (error, trace) {
              return const Scaffold(
                body: Center(
                  child: Text('Something wrong happened'),
                ),
              );
              // return const WelcomePage();
            },
            loading: () => const SizedBox(),
          ),
      // home: const ContactPage(),
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
