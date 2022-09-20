import 'dart:math';

import 'package:flutter/material.dart';

/// Vector 2.
class Vector2 {
  /// Default constructor.
  const Vector2(
    this.x,
    this.y,
  );

  /// Instantiates a [Vector2] from [Offset].
  Vector2.fromOffset(Offset offset)
      : x = offset.dx,
        y = offset.dy;

  /// Returns the origin.
  static const Vector2 zero = Vector2(0, 0);

  /// The x value.
  final double x;

  /// The y value.
  final double y;

  /// Returns the dot product of this vector and the other vector.
  double dot(Vector2 other) {
    return x * other.x + y * other.y;
  }

  /// Vector addition.
  Vector2 operator +(Vector2 other) {
    return Vector2(x + other.x, y + other.y);
  }

  /// Vector subtraction.
  Vector2 operator -(Vector2 other) {
    return Vector2(x - other.x, y - other.y);
  }

  /// Returns the vector scaled with [scalar].
  Vector2 scale(double scalar) {
    return Vector2(x * scalar, y * scalar);
  }

  /// Returns the norm of the vector.
  double norm() {
    return sqrt(dot(this));
  }

  /// Returns anormalized copy of this vector.
  Vector2 normalized() {
    return scale(1 / norm());
  }

  @override
  String toString() {
    return 'Vector2($x, $y)';
  }
}
