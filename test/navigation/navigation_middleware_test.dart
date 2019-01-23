import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:too_good_to_go/appstate/app_state.dart';
import 'package:too_good_to_go/appstate/app_state_reducer.dart';
import 'package:too_good_to_go/location/location.dart';
import 'package:too_good_to_go/navigation/navigation_actions.dart';
import 'package:too_good_to_go/navigation/navigation_middleware.dart';

import '../mocks.dart';

main() {
  group('Navigation Middleware', () {
    test('it uses url launcher to open Google Maps', () {
      final mockUrlLauncher = MockUrlLauncher();

      when(mockUrlLauncher.canLaunch(any))
          .thenAnswer((_) => SynchronousFuture(true));

      final store = Store<AppState>(
        appStateReducer,
        initialState: AppState(),
        middleware: createNavigationMiddleware(mockUrlLauncher)
      );

      final location = Location((b) => b
        ..lat = 50
        ..lng = 10
      );

      store.dispatch(OpenGoogleMapsAction(location));

      final googleMapsUrl = 'comgooglemaps://?center=${location.lat},${location.lng}';

      verifyInOrder([
        mockUrlLauncher.canLaunch(googleMapsUrl),
        mockUrlLauncher.launch(googleMapsUrl),
      ]);
    });

    test('it doesnt call can launch if it cant launch', () {
      final mockUrlLauncher = MockUrlLauncher();

      when(mockUrlLauncher.canLaunch(any))
          .thenAnswer((_) => SynchronousFuture(false));

      final store = Store<AppState>(
          appStateReducer,
          initialState: AppState(),
          middleware: createNavigationMiddleware(mockUrlLauncher)
      );

      final location = Location((b) => b
        ..lat = 50
        ..lng = 10
      );

      store.dispatch(OpenGoogleMapsAction(location));

      verifyNever(mockUrlLauncher.launch(any));
    });
  });
}