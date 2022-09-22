import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_farm/player/movement_controller.dart';

/// Updates the game's frames.
class FrameController extends StateNotifier<int> {
  /// Default constructor.
  FrameController(this.ref)
      : super(
          0,
        );

  /// Riverpod reference.
  final Ref ref;

  /// Provides the frame controller.
  static final StateNotifierProvider<FrameController, int> provider = StateNotifierProvider<FrameController, int>(
    FrameController.new,
  );

  /// Updates the frames.
  Timer? frameTimer;

  /// The current frame's number.
  int get frameCount => state;

  /// Updates the frame.
  void updateFrame() {
    ref.read(MovementController.provider.notifier).updatePosition();

    state++;
  }

  /// Starts the frame timer.
  void start() {
    frameTimer = Timer.periodic(
      const Duration(milliseconds: 7),
      (timer) {
        updateFrame();
      },
    );
  }
}
