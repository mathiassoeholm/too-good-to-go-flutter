import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../mocks.dart';

void expectNoTextToContainNull() {
  find.byType(Text).evaluate().forEach((element) {
    final text = (element.widget as Text).data;
    expect(text.contains('null'), equals(false), reason: 'Text was: $text');
  });
}
