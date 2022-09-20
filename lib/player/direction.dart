import 'package:poke_farm/utilities/math/vector_2.dart';

/// Direction enum.
enum Direction {
  ///
  up,

  ///
  down,

  ///
  left,

  ///
  right,

  ///
  none;

  /// Returns the direction as a vector.
  Vector2 get vector {
    switch (this) {
      case Direction.up:
        return const Vector2(0, -1);
      case Direction.down:
        return const Vector2(0, 1);
      case Direction.left:
        return const Vector2(-1, 0);
      case Direction.right:
        return const Vector2(1, 0);
      case Direction.none:
        return Vector2.zero;
    }
  }
}
