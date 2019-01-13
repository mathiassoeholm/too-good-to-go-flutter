import 'dart:async';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:test/test.dart';
import 'package:too_good_to_go/appstate/app_state.dart';
import 'package:too_good_to_go/appstate/app_state_actions.dart';
import 'package:too_good_to_go/appstate/app_state_reducer.dart';
import 'package:too_good_to_go/location/location_actions.dart';
import 'package:too_good_to_go/location/location_middleware.dart';

import '../mocks.dart';

main() {
  group('Location Middleware', () {
    test('it should listen to location changes', () {
      final mockLocation = MockLocation();
      final captor = MockMiddleware();

      final streamController = StreamController<Map<String, double>>(sync: true);

      when(mockLocation.onLocationChanged()).thenAnswer((_) =>
        streamController.stream);

      final store = Store<AppState>(
        appStateReducer,
        initialState: AppState(),
        middleware: createLocationMiddleware(mockLocation)
          ..add(captor),
      );

      verifyNever(mockLocation.onLocationChanged());

      store.dispatch(AppInitAction());

      verify(mockLocation.onLocationChanged());

      verifyNeverDispatchAction<SetLocationAction>(captor);

      streamController.add({
        'latitude': 50,
        'longitude': 10,
      });

      verifyDispatchAction<SetLocationAction>(captor);

      streamController.close();
    });

    test('it should not distpach anything when event data is wrong', () {
      final mockLocation = MockLocation();
      final captor = MockMiddleware();

      final streamController = StreamController<Map<String, double>>(sync: true);

      when(mockLocation.onLocationChanged()).thenAnswer((_) =>
        streamController.stream);

      final store = Store<AppState>(
        appStateReducer,
        initialState: AppState(),
        middleware: createLocationMiddleware(mockLocation)
          ..add(captor),
      );

      store.dispatch(AppInitAction());

      streamController.add({
        'wrong-key': 50,
      });

      verifyNeverDispatchAction<SetLocationAction>(captor);

      streamController.close();
    });
  });
}

void verifyDispatchAction<Action>(MockMiddleware middleware) {
  verify(middleware.call(
    any,
    TypeMatcher<Action>(),
    any,
  ) as dynamic);
}

void verifyNeverDispatchAction<Action>(MockMiddleware middleware) {
  verifyNever(middleware.call(
    any,
    TypeMatcher<Action>(),
    any,
  ) as dynamic);
}