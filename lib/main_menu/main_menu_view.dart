import 'package:flutter/material.dart';
import 'package:poke_farm/constants/colours.dart';
import 'package:poke_farm/ingame/ingame_screen.dart';
import 'package:poke_farm/managers/routing/routing_functions.dart';

/// Main menu screen.
class MainMenuView extends StatelessWidget {
  /// Default constructor.
  const MainMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSoftBlack,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Text(
                'Poke Farm',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () {
                  pushReplacement(
                    context,
                    const IngameScreen(),
                  );
                },
                child: const Text(
                  'Play',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const Text(
                'Editor',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Settings',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
