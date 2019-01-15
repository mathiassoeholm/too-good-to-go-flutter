import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:too_good_to_go/feed/widgets/details_view.dart';
import 'package:too_good_to_go/feed/models/feed_item.dart';
import '../utilities/test_utilites.dart';

void main() {
  testWidgets('DetailsView displays various info', (WidgetTester tester) async {
    final item = FeedItem((b) => b
      ..companyName = 'Food Inc.'
      ..price['dkk'] = 45
      ..originalPrice['dkk'] = 100
      ..favorites = 500
      ..address = 'Nykertemindevej 56a, 8340 Langskov');

    await tester.pumpWidget(MaterialApp(home: DetailsView(item)));

    expect(find.text('Food Inc.'), findsOneWidget);
    expect(find.text('45 DKK'), findsOneWidget);
    expect(find.text('500'), findsOneWidget);
    expect(find.text('100 DKK'), findsOneWidget);
    expect(find.text('Nykertemindevej 56a, 8340 Langskov'), findsOneWidget);
  });

  testWidgets('DetailsView never writes null', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: DetailsView(FeedItem())));

    expectNoTextToContainNull();
  });

  testWidgets('DetailsView checks if dkk is in the map ', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home:
    DetailsView(
        FeedItem((b) => b
          ..price['usd'] = 44
          ..price['eur'] = 32
          ..originalPrice['usd'] = 89
          ..originalPrice['eur'] = 32)
        )
      )
    );

    expectNoTextToContainNull();
  });
}


