import 'package:flutter/foundation.dart';
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

    test('It calls getFeed and succeeds', () {
      final mockFeedService = MockFeedService();
      final mockCompleter = MockCompleter();
      final captor = MockMiddleware();

      when(mockFeedService.getFeed()).thenAnswer((_) =>
          SynchronousFuture([FeedItem()]));

      final store = Store<AppState>(
        appStateReducer,
        initialState: AppState(),
        middleware: createFeedMiddleware(mockFeedService)
          ..add(captor),
      );

      store.dispatch(FetchItemsAction(completer: mockCompleter));

      verify(mockFeedService.getFeed());

      verifyDispatchAction<FetchItemsSucceededAction>(captor);
      verifyNeverDispatchAction<FetchItemsFailedAction>(captor);

      verify(mockCompleter.complete());
    });

    test('It calls getFeed and fails', () {
      final mockFeedService = MockFeedService();
      final mockCompleter = MockCompleter();
      final captor = MockMiddleware();

      when(mockFeedService.getFeed()).thenThrow(Exception());

      final store = Store<AppState>(
        appStateReducer,
        initialState: AppState(),
        middleware: createFeedMiddleware(mockFeedService)
          ..add(captor),
      );

      store.dispatch(FetchItemsAction(completer: mockCompleter));

      verify(mockFeedService.getFeed());

      verifyDispatchAction<FetchItemsFailedAction>(captor);
      verifyNeverDispatchAction<FetchItemsSucceededAction>(captor);

      verify(mockCompleter.complete());
    });
  });
}

void verifyDispatchAction<Action>(MockMiddleware middleware) {
  verify(middleware.call(
    any,
    TypeMatcher<Action>(),
    any,
  ) as dynamic);
}

void verifyNeverDispatchAction<Action>(MockMiddleware middleware) {
  verifyNever(middleware.call(
    any,
    TypeMatcher<Action>(),
    any,
  ) as dynamic);
}

