import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_farm/player/player_controller.dart';
import 'package:poke_farm/player/player_view.dart';
import 'package:poke_farm/utilities/math/vector_2.dart';

/// In game screen.
class IngameScreen extends ConsumerStatefulWidget {
  /// Default constructor.
  const IngameScreen({super.key});

  @override
  ConsumerState<IngameScreen> createState() => _IngameScreenState();
}

class _IngameScreenState extends ConsumerState<IngameScreen> {
  double left = 0;
  double top = 0;

  Offset start = Offset.zero;

  double dot(Offset a, Offset b) {
    return a.dx * b.dx + a.dy * b.dy;
  }

  Timer? timer;

  @override
  Widget build(BuildContext context) {
    final playerController = ref.read(PlayerController.provider.notifier);

    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onPanStart: (details) => playerController.startMoving(
            Vector2.fromOffset(details.localPosition),
          ),
          onPanEnd: (details) => playerController.stopMoving(),
          onPanUpdate: (details) {
            final current = details.localPosition;
            final direction = current - start;

            start = current;

            final List<double> dotProducts = [
              dot(direction, const Offset(1, 0)),
              dot(direction, const Offset(-1, 0)),
              dot(direction, const Offset(0, 1)),
              dot(direction, const Offset(0, -1)),
            ];

            final double max = dotProducts.reduce((a, b) => a > b ? a : b);
            final index = dotProducts.indexOf(max);

            switch (index) {
              case 0:
                timer?.cancel();
                setState(() {
                  left += 1;
                });
                timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
                  setState(() {
                    left += 1;
                  });
                });
                break;
              case 1:
                timer?.cancel();
                setState(() {
                  left -= 1;
                });
                timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
                  setState(() {
                    left -= 1;
                  });
                });
                break;
              case 2:
                timer?.cancel();
                setState(() {
                  top += 1;
                });
                timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
                  setState(() {
                    top += 1;
                  });
                });
                break;
              case 3:
                timer?.cancel();
                setState(() {
                  top -= 1;
                });
                timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
                  setState(() {
                    top -= 1;
                  });
                });
                break;
            }
          },
          child: Stack(
            children: [
              const SizedBox.expand(
                child: ColoredBox(
                  color: Colors.black,
                ),
              ),
              Positioned(
                left: left,
                top: top,
                child: const PlayerView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
