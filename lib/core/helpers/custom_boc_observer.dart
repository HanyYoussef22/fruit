import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    // Log details about events
    if (kDebugMode) {
      log('📢 Event in ${bloc.runtimeType}: $event');
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // Log state changes
    if (kDebugMode) {
      log('🔄 State Change in ${bloc.runtimeType}: $change');
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // Log state transitions
    if (kDebugMode) {
      log(
          '➡️ Transition in ${bloc.runtimeType}: From ${transition.currentState} To ${transition.nextState} (Event: ${transition.event})');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    // Log errors
    if (kDebugMode) {
      log(
          '❌ Error in ${bloc.runtimeType}: $error\nStackTrace: $stackTrace');
    }
  }
}
