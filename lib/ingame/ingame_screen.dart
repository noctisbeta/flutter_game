import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_farm/game/frame_controller.dart';
import 'package:poke_farm/player/movement_controller.dart';
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
  // late Timer frameTimer;

  @override
  void initState() {
    super.initState();

    ref.read(FrameController.provider.notifier).start();
  }

  @override
  Widget build(BuildContext context) {
    final playerController = ref.read(MovementController.provider.notifier);
    final movementState = ref.read(MovementController.provider);

    ref.watch(FrameController.provider);

    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onPanUpdate: (details) => playerController.onMovementUpdate(
            Vector2.fromOffset(details.localPosition),
          ),
          onPanEnd: (details) => playerController.stopMoving(),
          child: Stack(
            children: [
              const SizedBox.expand(
                child: ColoredBox(
                  color: Colors.black,
                ),
              ),
              Positioned(
                left: movementState.position.x,
                top: movementState.position.y,
                child: const PlayerView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
