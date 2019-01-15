import 'package:location/location.dart';
import 'package:redux/redux.dart';
import 'package:too_good_to_go/appstate/app_state.dart';
import 'package:too_good_to_go/feed/feed_middleware.dart';
import 'package:too_good_to_go/feed/feed_service.dart';
import 'package:too_good_to_go/location/location_middleware.dart';

List<Middleware<AppState>> createAppStateMiddleware(
    FeedService feedService,
    Location location,
) {
  return []
    ..addAll(createFeedMiddleware(feedService))
    ..addAll(createLocationMiddleware(location))
    // Uncomment to see what's going on:
    //..add(LoggingMiddleware.printer())
  ;
}