import 'package:flutter/material.dart';

/// Model for the route state.
class RouteState {
  /// Default constructor.
  const RouteState({
    required this.route,
  });

  /// The current route.
  final MaterialPageRoute? route;
}
