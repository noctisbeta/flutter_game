import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_farm/environment/environment.dart';

/// Provides the environment.
class EnvironmentNotifier extends StateNotifier<Environment> {
  /// Default constructor.
  EnvironmentNotifier()
      : super(
          const Environment(),
        );

  /// Provides the environment notifier.
  static final StateNotifierProvider<EnvironmentNotifier, Environment> provider = StateNotifierProvider<EnvironmentNotifier, Environment>(
    (ref) => EnvironmentNotifier(),
  );

  /// Provides the environment notifier.
  void loadEnvironment(Environment environment) {
    state = environment;
  }
}
