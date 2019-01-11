import 'package:redux/redux.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:too_good_to_go/appstate/app_state.dart';
import 'package:too_good_to_go/appstate/app_state_reducer.dart';
import 'package:too_good_to_go/feed/feed_actions.dart';
import 'package:too_good_to_go/feed/feed_middleware.dart';
import 'package:too_good_to_go/feed/models/feed_item.dart';

import '../mocks.dart';

main() {
  group('Feed Middleware', () {

    test('It calls getFeed', () {
      final mockFeedService = MockFeedService();
      final captor = MockMiddleware();

      final store = Store<AppState>(
          appStateReducer,
          initialState: AppState(),
          middleware: createFeedMiddleware(mockFeedService)
            ..add(captor),
      );

      when(mockFeedService.getFeed()).thenAnswer((_) =>
          Future.value([FeedItem()]));

      store.dispatch(FetchItemsAction());

      verify(mockFeedService.getFeed());
      verifyDispatchAction<FetchItemsSucceededAction>(captor);
      verifyNeverDispatchAction<FetchItemsFailedAction>(captor);
    });
  });
}

void verifyDispatchAction<Action>(middleware) {
  verify(middleware.call(
    any,
    TypeMatcher<Action>(),
    any,
  ) as dynamic);
}

void verifyNeverDispatchAction<Action>(middleware) {
  verifyNever(middleware.call(
    any,
    TypeMatcher<Action>(),
    any,
  ) as dynamic);
}