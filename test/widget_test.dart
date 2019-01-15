import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:too_good_to_go/appstate/app_state.dart';
import 'package:too_good_to_go/main.dart';
import 'package:too_good_to_go/shared/widgets/change-color-button.dart';

void main() {
  testWidgets('The title is displayed', (WidgetTester tester) async {

    final Store<AppState> store = Store<AppState>(
        null,
        initialState: AppState(),
    );

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(store));

    expect(find.text("Too Good To Go"), findsOneWidget);
  });

  testWidgets('ChangeColorButton works', (WidgetTester tester) async {

    var pressedButton = false;

    await tester.pumpWidget(Directionality(
      textDirection: TextDirection.ltr,
      child: ChangeColorButton(
        iconData: Icons.add_shopping_cart,
        size: 33,
        onPressed: () {
          pressedButton = true;
        },
      ),
    ));

    final icon = find.byIcon(Icons.add_shopping_cart);

    expect(icon, findsOneWidget);

    expect(pressedButton, equals(false));
    await tester.tap(icon);
    expect(pressedButton, equals(true));
  });
}
