import 'package:redux/redux.dart';
import 'package:too_good_to_go/feed/feed.dart';
import 'package:too_good_to_go/feed/feed_actions.dart';

final feedReducer = combineReducers<Feed>([
  TypedReducer<Feed, SetItemsAction>(_setFeed)
]);

Feed _setFeed(Feed state, SetItemsAction action) {
  return state.rebuild((b) => b
    ..items = action.items
  );
}
