import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_farm/main_menu/main_menu_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ],
  );

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  await SystemChrome.setSystemUIChangeCallback(
    (systemOverlaysAreVisible) async {
      if (!systemOverlaysAreVisible) {
        Timer(const Duration(seconds: 2), () {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
        });
      }
    },
  );

  runApp(
    const ProviderScope(
      child: MaterialApp(
        home: InitApp(),
      ),
    ),
  );
}

/// Entry point for the app.
class InitApp extends StatelessWidget {
  /// Default constructor.
  const InitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainMenuView();
  }
}
