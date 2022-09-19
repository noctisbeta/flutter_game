import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_farm/player/movement_state.dart';
import 'package:poke_farm/utilities/math/vector_2.dart';

/// Player controller.
class PlayerController extends StateNotifier<MovementState> {
  /// Default constructor.
  PlayerController()
      : super(
          const MovementState.initial(),
        );

  /// Provides the player controller.
  static final StateNotifierProvider<PlayerController, MovementState> provider = StateNotifierProvider<PlayerController, MovementState>(
    (ref) => PlayerController(),
  );

  /// Called when the player starts moving.
  void startMoving(Vector2 origin) {
    state = state.copyWith(
      isMoving: true,
      origin: origin,
    );
  }

  /// Called when the player stops moving.
  void stopMoving() {
    state = state.copyWith(
      isMoving: false,
      origin: Vector2.zero,
    );
  }

  void onMovementUpdate(Vector2 origin) {
    state = state.copyWith(
      isMoving: true,
      origin: origin,
    );
  }
}
