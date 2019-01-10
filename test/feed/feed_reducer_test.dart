import 'package:redux/redux.dart';
import 'package:test/test.dart';
import 'package:too_good_to_go/appstate/app_state.dart';
import 'package:too_good_to_go/appstate/app_state_reducer.dart';
import 'package:too_good_to_go/feed/feed_actions.dart';
import 'package:too_good_to_go/feed/models/feed_item.dart';

main() {
  group('Feed Reducer', () {
    test('should load feed into store', () {
      final feedItem1 = FeedItem((b) => b..companyName = 'Company 1');
      final feedItem2 = FeedItem((b) => b..companyName = 'Company 3');
      final feedItem3 = FeedItem((b) => b..companyName = 'Company 4');

      final feedItems = [feedItem1, feedItem2, feedItem3];

      final store = Store<AppState>(
        appStateReducer,
        initialState: AppState(),
      );

      expect(store.state.feed.items, []);

      store.dispatch(SetItemsAction(feedItems));

      expect(store.state.feed.items, feedItems);
    });
  });
}