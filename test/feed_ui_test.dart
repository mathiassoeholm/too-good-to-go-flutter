// Plan
// Create a feed_item instance
// Pump a FeedItemWidget using the feed_item
// Ensure all info is shown
// Ensure press action gets invoked (Use mockito?)

import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:too_good_to_go/feed/models/feed_item.dart';
import 'package:too_good_to_go/feed/widgets/FeedItemView.dart';
import 'package:too_good_to_go/feed/widgets/FeedView.dart';

void main() {
  testWidgets('It displays the company name', (WidgetTester tester) async {
    final item = FeedItem((b) => b..companyName = 'Food Inc.');

    await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr, child: FeedItemView(item)));

    expect(find.text('Food Inc.'), findsOneWidget);
  });

  testWidgets('Feed List Widget', (WidgetTester tester) async {
    final completer = new Completer<List<FeedItem>>();

    await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr, child: FeedView(completer.future)));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    final item1 = FeedItem((b) => b..companyName = 'Food Inc.');
    final item2 = FeedItem((b) => b..companyName = 'Kickly');

    completer.complete([item1, item2]);

    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsNothing);

    final listView = find.byType(ListView);

    expect(listView, findsOneWidget);
    expect(find.descendant(of: listView, matching: find.byType(FeedItemView)), findsNWidgets(2));
  });
}
