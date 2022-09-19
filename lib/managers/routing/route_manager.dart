import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_farm/managers/routing/route_state.dart';

/// Manager for routing.
class RouteManager extends StateNotifier<RouteState> {
  /// Default constructor.
  RouteManager()
      : super(
          const RouteState(route: null),
        );

  /// Provides the route manager.
  static final StateNotifierProvider<RouteManager, RouteState> provider = StateNotifierProvider<RouteManager, RouteState>(
    (ref) => RouteManager(),
  );

  /// Sets the route.
  void setRoute(BuildContext context, Widget widget) {
    state = RouteState(
      route: MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }
}
