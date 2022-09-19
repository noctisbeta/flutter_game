import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_farm/environment/environment.dart';

/// Provides the environment.
class EnvironmentNotifier extends StateNotifier<Environment> {
  /// Default constructor.
  EnvironmentNotifier()
      : super(
          const Environment(),
        );
}
