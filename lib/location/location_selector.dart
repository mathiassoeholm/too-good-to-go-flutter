import 'package:latlong/latlong.dart';
import 'package:too_good_to_go/appstate/app_state.dart';
import 'package:too_good_to_go/feed/submodels/feed_item.dart';

Map<FeedItem, double> distancesSelector(AppState state) {
  if (state.location == null) {
    return {};
  }

  var distances = Map<FeedItem, double>();

  final userLocation = LatLng(state.location.lat, state.location.lng);

  state.feed.items.where((f) => f.location != null).forEach((f) {
    final itemLocation = LatLng(f.location.lat, f.location.lng);
    distances[f] = Distance()(itemLocation, userLocation);
  });

  return distances;
}
