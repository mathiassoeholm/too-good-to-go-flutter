import 'package:location/location.dart' as LocationProvider;
import 'package:redux/redux.dart';
import 'package:too_good_to_go/location/location.dart';
import 'package:too_good_to_go/appstate/app_state.dart';
import 'package:too_good_to_go/appstate/app_state_actions.dart';
import 'package:too_good_to_go/location/location_actions.dart';

List<Middleware<AppState>> createLocationMiddleware(LocationProvider.Location locationProvider) {
  return [
    TypedMiddleware<AppState, AppInitAction>(_listenToLocationChanges(locationProvider)),
  ];
}

Function(
  Store<AppState>,
  AppInitAction,
  NextDispatcher,
  ) _listenToLocationChanges(LocationProvider.Location locationProvider) => (store, action, next)
async {
  next(action);

  locationProvider.onLocationChanged().listen((event) {

    final lat = event['latitude'];
    final lng = event['longitude'];

    if (lat != null && lng != null) {
      final location = Location((b) => b
        ..lat = lat
        ..lng = lng
      );

      store.dispatch(SetLocationAction(location));
    }
  });
};
