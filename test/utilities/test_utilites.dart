import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:too_good_to_go/appstate/app_state.dart';
import 'package:too_good_to_go/appstate/app_state_reducer.dart';

void expectNoTextToContainNull() {
  find.byType(Text).evaluate().forEach((element) {
    final text = (element.widget as Text).data;
    expect(text.contains('null'), equals(false), reason: 'Text was: $text');
  });
}

Future<void> pumpWidgetWithState(WidgetTester tester, {
  AppState initialState,
  @required Widget widget,
}) {
  final store = Store<AppState>(
    appStateReducer,
    initialState: initialState ?? AppState()
  );

  return pumpWidgetWithStore(tester,
    store: store,
    widget: widget,
  );
}

Future<void> pumpWidgetWithStore(WidgetTester tester, {
  @required Store<AppState> store,
  @required Widget widget,
}) {
  return tester.pumpWidget(
      StoreProvider(
          store: store,
          child: MaterialApp(
            home: widget,
          )
      )
  );
}
