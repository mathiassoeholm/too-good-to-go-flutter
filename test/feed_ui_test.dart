import 'dart:async';
import 'package:mockito/mockito.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:too_good_to_go/feed/models/feed_item.dart';
import 'package:too_good_to_go/feed/widgets/FeedItemView.dart';
import 'package:too_good_to_go/feed/widgets/FeedView.dart';

import 'mocks.dart';

void main() {
  testWidgets('It displays the company name', (WidgetTester tester) async {
    final item = FeedItem((b) => b..companyName = 'Food Inc.');

    await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr, child: FeedItemView(item)));

    expect(find.text('Food Inc.'), findsOneWidget);
  });

  testWidgets('Feed List Widget', (WidgetTester tester) async {

    final streamController = StreamController<List<FeedItem>>();

    final mockBlock = MockFeedBlock();

    when(mockBlock.feed).thenAnswer((_) =>
      streamController.stream);

    await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: FeedView(feedBloc: mockBlock)
    ));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Add items
    final item1 = FeedItem((b) => b..companyName = 'Food Inc.');
    final item2 = FeedItem((b) => b..companyName = 'Kickly');
    streamController.add([item1, item2]);

    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsNothing);

    final listView = find.byType(ListView);

    expect(listView, findsOneWidget);
    expect(find.descendant(of: listView, matching: find.byType(FeedItemView)), findsNWidgets(2));

    streamController.close();
  });
}


// PLAN:
// 5. Use inherited widget to pass the bloc down to FeedView