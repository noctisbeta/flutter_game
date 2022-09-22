import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_farm/environment/environment.dart';
import 'package:poke_farm/environment/environment_notifier.dart';
import 'package:poke_farm/game/frame_controller.dart';
import 'package:poke_farm/player/movement_controller.dart';
import 'package:poke_farm/player/player_view.dart';
import 'package:poke_farm/utilities/math/matrix.dart';
import 'package:poke_farm/utilities/math/vector_2.dart';

/// In game screen.
class IngameScreen extends ConsumerStatefulWidget {
  /// Default constructor.
  const IngameScreen({super.key});

  @override
  ConsumerState<IngameScreen> createState() => _IngameScreenState();
}

class _IngameScreenState extends ConsumerState<IngameScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(FrameController.provider.notifier).start();

    ref.read(EnvironmentNotifier.provider.notifier).loadEnvironment(
          Environment(
            environmentData: Matrix.fromList(
              data: [
                [0, 1, 2],
                [2, 0, 1],
                [1, 2, 0],
              ],
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final playerController = ref.read(MovementController.provider.notifier);
    final movementState = ref.read(MovementController.provider);
    final environment = ref.read(EnvironmentNotifier.provider);

    ref.watch(FrameController.provider);

    final screenSize = MediaQuery.of(context).size;

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
              for (int i = 0; i < environment.environmentData!.data.length; i++)
                for (int j = 0; j < environment.environmentData!.data.elementAt(i).length; j++)
                  Positioned(
                    left: i * screenSize.width / environment.environmentData!.data.length,
                    top: j * screenSize.height / environment.environmentData!.data.length,
                    child: Container(
                      width: screenSize.width / environment.environmentData!.data.length,
                      height: screenSize.height / environment.environmentData!.data.length,
                      color: environment.environmentData!.data[i][j] == 0
                          ? Colors.green
                          : environment.environmentData!.data[i][j] == 1
                              ? Colors.blue
                              : Colors.red,
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
