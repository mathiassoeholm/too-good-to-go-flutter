import 'package:too_good_to_go/appstate/app_state.dart';
import 'package:too_good_to_go/feed/feed_reducer.dart';
import 'package:too_good_to_go/location/location_reducer.dart';

AppState appStateReducer(AppState state, action) {
  return AppState((b) => b
    ..feed = feedReducer(state.feed, action).toBuilder()
    ..location = locationReducer(state.location, action).toBuilder()
  );
}