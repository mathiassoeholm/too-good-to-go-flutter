import 'package:redux/redux.dart';
import 'package:too_good_to_go/feed/feed.dart';
import 'package:too_good_to_go/feed/feed_actions.dart';

final feedReducer = combineReducers<Feed>([
  TypedReducer<Feed, FetchItemsAction>(_fetchItems),
  TypedReducer<Feed, FetchItemsFailedAction>(_fetchItemsFailed),
  TypedReducer<Feed, FetchItemsSucceededAction>(_fetchItemsSucceeded),
]);

Feed _fetchItems(Feed state, FetchItemsAction action) {
  return state.rebuild((b) => b
    ..isFetching = true
  );
}

Feed _fetchItemsFailed(Feed state, FetchItemsFailedAction action) {
  return state.rebuild((b) => b
    ..fetchError = action.error
    ..isFetching = false
  );
}
Feed _fetchItemsSucceeded(Feed state, FetchItemsSucceededAction action) {
  return state.rebuild((b) => b
    ..items = action.items
    ..isFetching = false
  );
}
