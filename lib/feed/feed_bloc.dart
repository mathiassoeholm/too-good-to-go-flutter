import 'package:flutter/foundation.dart';
import 'package:location/location.dart';
import 'package:too_good_to_go/feed/feed_service.dart';
import 'package:too_good_to_go/feed/models/feed_item.dart';
import 'package:rxdart/rxdart.dart';

class FeedBloc {
  final FeedService _feedService;
  final Location _location;

  final _feedSubject = BehaviorSubject<List<FeedItem>>();

  Stream<List<FeedItem>> get feed => _feedSubject.stream;
  Stream<List<double>> get distances => _location.onLocationChanged().map((m) => [0.0]);

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
}