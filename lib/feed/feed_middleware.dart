import 'package:redux/redux.dart';
import 'package:too_good_to_go/appstate/app_state.dart';
import 'package:too_good_to_go/feed/feed_actions.dart';
import 'package:too_good_to_go/feed/feed_service.dart';

List<Middleware<AppState>> createFeedMiddleware(FeedService feedService) {
  return [
    TypedMiddleware<AppState, FetchItemsAction>(_createFetchItems(feedService)),
  ];
}

Function(
  Store<AppState>,
  FetchItemsAction,
  NextDispatcher,
) _createFetchItems(FeedService feedService) => (store, action, next)
async {
  next(action);

  try {
    final items = await feedService.getFeed();

    store.dispatch(FetchItemsSucceededAction(items));
    action.completer.complete();
  } catch (error) {
    store.dispatch(FetchItemsFailedAction(error));
    action.completer.complete();
  }
};
