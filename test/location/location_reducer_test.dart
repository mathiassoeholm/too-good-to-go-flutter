import 'package:redux/redux.dart';
import 'package:test/test.dart';
import 'package:too_good_to_go/appstate/app_state.dart';
import 'package:too_good_to_go/appstate/app_state_reducer.dart';
import 'package:too_good_to_go/location/location.dart';
import 'package:too_good_to_go/location/location_actions.dart';

main() {
  group('Location Reducer', () {
    test('should set location', () {
      final store = Store<AppState>(
        appStateReducer,
        initialState: AppState(),
      );

      expect(store.state.location, null);

      final newLocation = Location((b) => b
        ..lat = 50
        ..lng = 100
      );

      store.dispatch(SetLocationAction(newLocation));

      expect(store.state.location, newLocation);
    });
  });
}