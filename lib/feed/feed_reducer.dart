import 'package:redux/redux.dart';
import 'package:too_good_to_go/feed/feed.dart';
import 'package:too_good_to_go/feed/feed_actions.dart';

final feedReducer = combineReducers<Feed>([
  TypedReducer<Feed, FetchItemsAction>(_fetchItems),
  TypedReducer<Feed, FetchItemsFailedAction>(_fetchItemsFailed),
  TypedReducer<Feed, FetchItemsSucceededAction>(_fetchItemsSucceeded),
  TypedReducer<Feed, SelectItemAction>(_selectItem),
  TypedReducer<Feed, ClearSelectionAction>(_clearSelection),
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

Feed _selectItem(Feed state, SelectItemAction action) {
  return state.rebuild((b) => b
    ..selectedItem = action.item.toBuilder()
  );
}

Feed _clearSelection(Feed state, ClearSelectionAction action) {
  return state.rebuild((b) => b
    ..selectedItem = null
  );
}
