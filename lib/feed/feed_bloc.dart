import 'package:flutter/foundation.dart';
import 'package:too_good_to_go/feed/feed_service.dart';
import 'package:too_good_to_go/feed/models/feed_item.dart';
import 'package:rxdart/rxdart.dart';

class FeedBloc {
  final FeedService _feedService;
  final _feedSubject = BehaviorSubject<List<FeedItem>>();

  Stream<List<FeedItem>> get feed => _feedSubject.stream;

  FeedBloc({@required feedService })
      : _feedService = feedService {

    _feedService.getFeed().then((feed) {
      _feedSubject.value = feed;
    });
  }
}