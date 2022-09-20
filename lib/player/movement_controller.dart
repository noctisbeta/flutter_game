import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_farm/player/direction.dart';
import 'package:poke_farm/player/movement_state.dart';
import 'package:poke_farm/utilities/math/vector_2.dart';

/// Player controller.
class MovementController extends StateNotifier<MovementState> {
  /// Default constructor.
  MovementController()
      : super(
          const MovementState.initial(),
        );

  /// Provides the player controller.
  static final StateNotifierProvider<MovementController, MovementState> provider = StateNotifierProvider<MovementController, MovementState>(
    (ref) => MovementController(),
  );

  /// Called when the player stops moving.
  void stopMoving() {
    state = state.copyWith(
      isMoving: false,
      origin: Vector2.zero,
      direction: Direction.none,
    );
  }

  /// Called when the player moves.
  void onMovementUpdate(Vector2 current) {
    if (state.direction == Direction.none && state.origin == Vector2.zero) {
      state = state.copyWith(
        isMoving: false,
        origin: current,
      );
    }

    log((current - state.origin).norm().toString());
    if ((current - state.origin).norm() < 5) {
      return;
    }

    final direction = getMovementDirection(current);

    // if (direction == state.direction) {
    //   return;
    // }

    state = state.copyWith(
      isMoving: true,
      origin: current,
      direction: direction,
    );
  }

  /// Returns the [Direction] of the movement from [state]'s origin to [current].
  Direction getMovementDirection(Vector2 current) {
    final directionVector = current - state.origin;

    final dotProducts = MovementState.directions
        .map(
          (direction) => directionVector.dot(direction.vector),
        )
        .toList();

    final maxDot = dotProducts.reduce(
      (a, b) => a > b ? a : b,
    );

    return MovementState.directions.elementAt(dotProducts.indexOf(maxDot));
  }

  /// Updates the [state]'s position.
  void updatePosition() {
    state = state.copyWith(
      position: state.position + state.direction.vector.scale(4),
    );
  }
}
