import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:too_good_to_go/appstate/app_state.dart';
import 'package:too_good_to_go/feed/feed_actions.dart';
import 'package:too_good_to_go/feed/widgets/details_view.dart';
import 'package:too_good_to_go/feed/submodels/feed_item.dart';
import 'package:too_good_to_go/feed/widgets/feed_item_view.dart';
import 'package:too_good_to_go/feed/widgets/feed_view.dart';
import 'package:too_good_to_go/appstate/app_state_reducer.dart';

import '../utilities/test_utilites.dart';

void main() {
  testWidgets('it toggles progress indicator and list view', (WidgetTester tester) async {
    final store = Store<AppState>(
      appStateReducer,
      initialState: AppState(),
    );

    await pumpWidgetWithStore(tester,
      store: store,
      widget: FeedView(),
    );

    store.dispatch(FetchItemsAction());

    await tester.pump();
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Add items
    final item1 = FeedItem((b) => b..companyName = 'Food Inc.');
    final item2 = FeedItem((b) => b..companyName = 'Kickly');

    store.dispatch(FetchItemsSucceededAction([item1, item2]));

    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsNothing);

    final listView = find.byType(CustomScrollView);

    expect(listView, findsOneWidget);
    expect(find.descendant(of: listView, matching: find.byType(FeedItemView)),
        findsNWidgets(2));
  });

  testWidgets('it navigates to DetailsPage when pressing feed item',
          (WidgetTester tester) async {
    final store = Store<AppState>(
      appStateReducer,
      initialState: AppState((b) => b..feed.items = [FeedItem()]),
    );

    await pumpWidgetWithStore(tester,
      store: store,
      widget: FeedView(),
    );

    // Simulate press
    (find.byType(FeedItemView).evaluate().first.widget as FeedItemView).onPressed();

    await tester.pumpAndSettle();

    expect(find.byType(FeedView), findsNothing);
    expect(find.byType(DetailsView), findsOneWidget);

    expect(store.state.feed.selectedItem, store.state.feed.items[0]);
  });
}


