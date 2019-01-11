import 'package:redux/redux.dart';
import 'package:too_good_to_go/appstate/app_state.dart';
import 'package:too_good_to_go/feed/feed_middleware.dart';
import 'package:too_good_to_go/feed/feed_service.dart';

List<Middleware<AppState>> createAppStateMiddleware(FeedService feedService) {
  return []
    ..addAll(createFeedMiddleware(feedService))
  ;
}