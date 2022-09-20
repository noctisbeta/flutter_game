import 'package:poke_farm/player/direction.dart';
import 'package:poke_farm/utilities/math/vector_2.dart';

/// Movement state.
class MovementState {
  /// Default constructor.
  const MovementState({
    required this.isMoving,
    required this.origin,
    required this.direction,
    required this.position,
  });

  /// Initial state.
  const MovementState.initial()
      : isMoving = false,
        origin = Vector2.zero,
        direction = Direction.none,
        position = Vector2.zero;

  /// Whether the player is moving.
  final bool isMoving;

  /// Start point of the pan.
  final Vector2 origin;

  /// Direction vector of movement.
  final Direction direction;

  /// Position on the environment.
  final Vector2 position;

  /// Directions.
  static final directions = [
    Direction.up,
    Direction.down,
    Direction.left,
    Direction.right,
  ];

  /// Returns a copy of this state with the given values.
  MovementState copyWith({
    bool? isMoving,
    Vector2? origin,
    Direction? direction,
    Vector2? position,
  }) {
    return MovementState(
      isMoving: isMoving ?? this.isMoving,
      origin: origin ?? this.origin,
      direction: direction ?? this.direction,
      position: position ?? this.position,
    );
  }
}
