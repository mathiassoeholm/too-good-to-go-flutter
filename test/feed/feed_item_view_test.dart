import 'dart:async';
import 'package:mockito/mockito.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:too_good_to_go/feed/models/feed_item.dart';
import 'package:too_good_to_go/feed/widgets/feed_item_distance_text.dart';
import 'package:too_good_to_go/feed/widgets/feed_item_view.dart';
import '../mocks.dart';
import '../utilities/test_utilites.dart';

void main() {
  testWidgets('FeedItemView displays various info', (WidgetTester tester) async {
    final item = FeedItem((b) => b
      ..companyName = 'Food Inc.'
      ..price['dkk'] = 45
      ..favorites = 500
      ..timeStart = '12:00'
      ..timeEnd = '13:35');

    await tester.pumpWidget(MaterialApp(home: FeedItemView(item)));

    expect(find.text('Food Inc.'), findsOneWidget);
    expect(find.text('45 DKK'), findsOneWidget);
    expect(find.text('500'), findsOneWidget);
    expect(find.text('12:00 - 13:35'), findsOneWidget);
  });

  testWidgets('Displays distance', (WidgetTester tester) async {
    final mockBlock = MockFeedBloc();

    final shop400 = FeedItem((b) => b..companyName = 'shop 400m away');
    final shop500 = FeedItem((b) => b..companyName = 'shop 500m away');
    final shop1200 = FeedItem((b) => b..companyName = 'shop 1200m away');
    final shop100000 = FeedItem((b) => b..companyName = 'shop 100.000m away');

    when(mockBlock.distances).thenAnswer((_) => Stream.fromIterable([
          {
            shop400: 400.12,
            shop500: 499.999,
            shop1200: 1210,
            shop100000: 100000,
          }
        ]));

    await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          children: <Widget>[
            FeedItemDistanceText(feedItem: shop400, feedBloc: mockBlock),
            FeedItemDistanceText(feedItem: shop500, feedBloc: mockBlock),
            FeedItemDistanceText(feedItem: shop1200, feedBloc: mockBlock),
            FeedItemDistanceText(feedItem: shop100000, feedBloc: mockBlock),
          ],
        )));

    // StreamBuilder needs pump before it builds from stream
    await tester.pump();

    expect(find.text('400 m'), findsOneWidget);
    expect(find.text('500 m'), findsOneWidget);
    expect(find.text('1.2 km'), findsOneWidget);
    expect(find.text('100 km'), findsOneWidget);
  });

  testWidgets('Displays nothing if distance is unknown',
      (WidgetTester tester) async {
    final mockBlock = MockFeedBloc();

    final shopUnknownDistance =
        FeedItem((b) => b..companyName = 'shop unknown distance');

    when(mockBlock.distances)
        .thenAnswer((_) => Stream.fromIterable([Map<FeedItem, num>()]));

    await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: FeedItemDistanceText(
            feedItem: shopUnknownDistance, feedBloc: mockBlock)));

    // StreamBuilder needs pump before it builds from stream
    await tester.pump();

    expect(find.byType(Text), findsNothing);
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


