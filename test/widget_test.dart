import 'package:flutter_test/flutter_test.dart';
import 'package:too_good_to_go/main.dart';

void main() {
  testWidgets('The title is displayed', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    expect(find.text("Too Good To Go"), findsOneWidget);
  });
}
