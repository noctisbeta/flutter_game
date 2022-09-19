import 'package:flutter/material.dart';

/// Vector 2.
class Vector2 {
  /// Default constructor.
  const Vector2({
    required this.x,
    required this.y,
  });

  /// Instantiates a [Vector2] from [Offset].
  Vector2.fromOffset(Offset offset)
      : x = offset.dx,
        y = offset.dy;

  /// Returns the origin.
  static const Vector2 zero = Vector2(x: 0, y: 0);

  /// The x value.
  final double x;

  /// The y value.
  final double y;

  /// Returns the dot product of this vector and the other vector.
  double dot(Vector2 other) {
    return x * other.x + y * other.y;
  }
}
