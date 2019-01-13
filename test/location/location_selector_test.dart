
import 'package:test/test.dart';
import 'package:too_good_to_go/appstate/app_state.dart';
import 'package:too_good_to_go/feed/models/feed_item.dart';
import 'package:too_good_to_go/location/location.dart';
import 'package:too_good_to_go/location/location_selector.dart';

main() {
  group('Location Selectors', () {
    test('should return distance for items with a location', () {
      final distanceBetweenFaktaAndKvickly = 44.64;

      final faktaLocation = Location((b) => b
        ..lat = 56.4151389
        ..lng = 10.8865822
      );

      final kvicklyLocation = Location((b) => b
        ..lat = 56.4150613
        ..lng = 10.8872942
      );

      final fakta = FeedItem((b) => b
        ..location = faktaLocation.toBuilder()
      );

      final kvickly = FeedItem((b) => b
        ..location = kvicklyLocation.toBuilder()
      );

      final unknown = FeedItem();

      final appState = AppState((b) => b
        ..location = kvicklyLocation.toBuilder()
        ..feed.items = [fakta, unknown, kvickly]
      );

      final distances = distancesSelector(appState);

      expect(distances.containsKey(unknown), false);
      expect(distances.length, 2);
      expect(distances[kvickly], 0);

      final allowedError = 0.5;
      expect(distances[fakta], greaterThanOrEqualTo(distanceBetweenFaktaAndKvickly - allowedError));
      expect(distances[fakta], lessThanOrEqualTo(distanceBetweenFaktaAndKvickly + allowedError));
    });

    test('should not return distances if user location is unknown', () {
      final feedItem = FeedItem((b) => b
        ..location.lat = 0
        ..location.lng = 0
      );

      final appState = AppState((b) => b
        ..feed.items = [feedItem]
      );

      final distances = distancesSelector(appState);
      expect(distances, {});
    });
  });
}