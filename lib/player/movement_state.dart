import 'package:poke_farm/utilities/math/vector_2.dart';

/// Movement state.
class MovementState {
  /// Default constructor.
  const MovementState({
    required this.isMoving,
    required this.origin,
  });

  /// Initial state.
  const MovementState.initial()
      : isMoving = false,
        origin = Vector2.zero;

  /// Whether the player is moving.
  final bool isMoving;

  /// Start point of the pan.
  final Vector2 origin;

  /// Returns a copy of this state with the given values.
  MovementState copyWith({
    bool? isMoving,
    Vector2? origin,
  }) {
    return MovementState(
      isMoving: isMoving ?? this.isMoving,
      origin: origin ?? this.origin,
    );
  }
}
