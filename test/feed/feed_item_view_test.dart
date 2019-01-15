
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:too_good_to_go/appstate/app_state.dart';
import 'package:too_good_to_go/feed/models/feed_item.dart';
import 'package:too_good_to_go/feed/widgets/feed_item_view.dart';
import '../utilities/test_utilites.dart';

void main() {
  testWidgets('FeedItemView displays various info', (WidgetTester tester) async {
    final item = FeedItem((b) => b
      ..companyName = 'Food Inc.'
      ..price['dkk'] = 45
      ..favorites = 500
      ..timeStart = '12:00'
      ..timeEnd = '13:35');

    final store = Store(
      null,
      initialState: AppState()
    );

    await tester.pumpWidget(StoreProvider(
      store: store,
      child: MaterialApp(home: FeedItemView(item))
    ));

    expect(find.text('Food Inc.'), findsOneWidget);
    expect(find.text('45 DKK'), findsOneWidget);
    expect(find.text('500'), findsOneWidget);
    expect(find.text('12:00 - 13:35'), findsOneWidget);
  });

  testWidgets('It never writes null', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: FeedItemView(FeedItem())));

    expectNoTextToContainNull();
  });

  testWidgets('It checks if dkk is in the map ', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home:
      FeedItemView(
          FeedItem((b) => b
            ..price['usd'] = 44
            ..price['eur'] = 32)
          )
        )
      );

    expectNoTextToContainNull();
  });
}


