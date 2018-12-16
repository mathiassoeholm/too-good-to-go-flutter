// Plan
// Create a feed_item instance
// Pump a FeedItemWidget using the feed_item
// Ensure all info is shown
// Ensure press action gets invoked (Use mockito?)

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:too_good_to_go/feed/models/feed_item.dart';
import 'package:too_good_to_go/feed/widgets/FeedItemWidget.dart';

void main() {
  testWidgets('It displays the company name', (WidgetTester tester) async {
    final item = FeedItem((b) => b..companyName = 'Food Inc.');

    await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr, child: FeedItemWidget(item)));

    expect(find.text('Food Inc.'), findsOneWidget);
  });
}
