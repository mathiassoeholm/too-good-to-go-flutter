import 'package:redux/redux.dart';
import 'package:test/test.dart';
import 'package:too_good_to_go/appstate/app_state.dart';
import 'package:too_good_to_go/appstate/app_state_reducer.dart';
import 'package:too_good_to_go/feed/feed_actions.dart';
import 'package:too_good_to_go/feed/submodels/feed_item.dart';

main() {
  group('Feed Reducer', () {
    test('should set isFetching when fetch is called', () {
      final store = Store<AppState>(
        appStateReducer,
        initialState: AppState(),
      );

      expect(store.state.feed.isFetching, false);

      store.dispatch(FetchItemsAction());

      expect(store.state.feed.isFetching, true);
    });

    test('should set isFetching and error message when it fails', () {
      final store = Store<AppState>(
        appStateReducer,
        initialState: AppState((b) => b..feed.isFetching = true),
      );

      expect(store.state.feed.isFetching, true);
      expect(store.state.feed.fetchError, null);

      store.dispatch(FetchItemsFailedAction(new FormatException("error-message")));

      expect(store.state.feed.isFetching, false);
      expect((store.state.feed.fetchError as FormatException).message, "error-message");
    });

    test('should set isFetching and items when it succeeds', () {
      final store = Store<AppState>(
        appStateReducer,
        initialState: AppState((b) => b..feed.isFetching = true),
      );

      final feedItem1 = FeedItem((b) => b..companyName = 'Company 1');
      final feedItem2 = FeedItem((b) => b..companyName = 'Company 2');

      final feedItems = [feedItem1, feedItem2];

      expect(store.state.feed.isFetching, true);
      expect(store.state.feed.items, []);

      store.dispatch(FetchItemsSucceededAction(feedItems));

      expect(store.state.feed.isFetching, false);
      expect(store.state.feed.items, feedItems);
    });

    test('should set selected item', () {
      final feedItem1 = FeedItem((b) => b..companyName = 'Company 1');
      final feedItem2 = FeedItem((b) => b..companyName = 'Company 2');

      final store = Store<AppState>(
        appStateReducer,
        initialState: AppState((b) => b
          ..feed.items = [feedItem1, feedItem2]
        )
      );

      expect(store.state.feed.selectedItem, null);

      store.dispatch(SelectItemAction(feedItem2));

      expect(store.state.feed.selectedItem, feedItem2);

      store.dispatch(ClearSelectionAction());

      expect(store.state.feed.selectedItem, null);
    });
  });
}