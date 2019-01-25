import 'package:flutter_test/flutter_test.dart';
import 'package:too_good_to_go/appstate/app_state.dart';
import 'package:too_good_to_go/feed/widgets/details_view.dart';
import 'package:too_good_to_go/feed/submodels/feed_item.dart';
import '../utilities/test_utilites.dart';

void main() {
  testWidgets('DetailsView displays various info', (WidgetTester tester) async {
    final item = FeedItem((b) => b
      ..companyName = 'Food Inc.'
      ..price['dkk'] = 45
      ..originalPrice['dkk'] = 100
      ..favorites = 500
      ..address = 'Nykertemindevej 56a, 8340 Langskov');

    await pumpWidgetWithStore(
      tester: tester,
      initialState: AppState((b) => b
        ..feed.selectedItem = item.toBuilder()
      ),
      widget: DetailsView(),
    );

    expect(find.text('Food Inc.'), findsOneWidget);
    expect(find.text('45 DKK'), findsOneWidget);
    expect(find.text('500'), findsOneWidget);
    expect(find.text('100 DKK'), findsOneWidget);
    expect(find.text('Nykertemindevej 56a, 8340 Langskov'), findsOneWidget);
  });

  testWidgets('DetailsView never writes null', (WidgetTester tester) async {
    await pumpWidgetWithStore(
      tester: tester,
      widget: DetailsView(),
    );

    expectNoTextToContainNull();
  });

  testWidgets('DetailsView checks if dkk is in the map ', (WidgetTester tester) async {

    final item = FeedItem((b) => b
      ..price['usd'] = 44
      ..price['eur'] = 32
      ..originalPrice['usd'] = 89
      ..originalPrice['eur'] = 32
    );

    await pumpWidgetWithStore(
      tester: tester,
      initialState: AppState((b) => b
        ..feed.selectedItem = item.toBuilder()
      ),
      widget: DetailsView(),
    );

    expectNoTextToContainNull();
  });
}

