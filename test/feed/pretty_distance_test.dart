import 'package:test/test.dart';
import 'package:too_good_to_go/feed/pretty_distance.dart';

main() {
  test('Pretty Distance', () {
    expect(prettyDistance(400.12), '400 m');
    expect(prettyDistance(499.999), '500 m');
    expect(prettyDistance(1210), '1.2 km');
    expect(prettyDistance(100000), '100 km');
  });
}