import 'package:redux/redux.dart';
import 'package:too_good_to_go/appstate/app_state.dart';
import 'package:too_good_to_go/navigation/navigation_actions.dart';
import 'package:too_good_to_go/shared/utilities/url_launcher.dart';

List<Middleware<AppState>> createNavigationMiddleware(UrlLauncher urlLauncher) {
  return [
    TypedMiddleware<AppState, OpenGoogleMapsAction>(_createOpenGoogleMaps(urlLauncher))
  ];
}

Function(
  Store<AppState>,
  OpenGoogleMapsAction,
  NextDispatcher,
  ) _createOpenGoogleMaps(UrlLauncher urlLauncher) => (store, action, next)
async {
  next(action);

  final location = action.location;
  final googleMapsUrl = 'comgooglemaps://?center=${location.lat},${location.lng}';

  urlLauncher.canLaunch(googleMapsUrl);
  urlLauncher.launch(googleMapsUrl);
};