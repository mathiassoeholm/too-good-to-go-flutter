import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';
import 'package:too_good_to_go/feed/feed_service.dart';
import 'package:too_good_to_go/feed/models/feed_item.dart';
import 'package:rxdart/rxdart.dart';

class FeedBloc {
  final FeedService _feedService;
  final Location _location;

  final _feedSubject = BehaviorSubject<List<FeedItem>>();

  Stream<List<FeedItem>> get feed => _feedSubject.stream;
  Stream<Map<FeedItem, num>> get distances => _getDistancesStream();

  FeedBloc({@required feedService, @required location }) :
    _feedService = feedService,
    _location = location
  {
    refresh();
  }

  Future<List<FeedItem>> refresh() async {
    return _feedService.getFeed().then((feed) {
      _feedSubject.value = feed;
    });
  }

  Stream<Map<FeedItem, num>> _getDistancesStream() =>
    StreamZip([feed, _location.onLocationChanged()]).map((feedAndLocation) {
      final feed = feedAndLocation[0] as List<FeedItem>;
      final location = feedAndLocation[1] as Map<String, double>;
      
      final userLocation = LatLng(location['latitude'], location['longitude']);

      var distances = Map<FeedItem, num>();

      feed.forEach((f) {
        final itemLocation = LatLng(f.location.lat, f.location.lng);
        final distance = Distance()(itemLocation, userLocation);
        distances[f] = distance;
      });

      return distances;
    });
}