import "package:test/test.dart";
import 'package:too_good_to_go/feed/feed_bloc.dart';
import 'package:too_good_to_go/feed/feed_service.dart';
import 'package:too_good_to_go/feed/models/feed_item.dart';
import 'package:mockito/mockito.dart';

import '../mocks.dart';


void main() {
  FeedItem foodIncItem;
  FeedItem kvicklyItem;
  FeedService mockFeedService;
  FeedBloc bloc;

  setUp(() {
    foodIncItem = FeedItem((b) => b..companyName = 'Food Inc.');
    kvicklyItem = FeedItem((b) => b..companyName = 'Kvickly');

    mockFeedService = MockFeedService();

    when(mockFeedService.getFeed()).thenAnswer((_) =>
        Future.value([foodIncItem]));

    bloc = FeedBloc(feedService: mockFeedService);
  });

  test('Feed bloc uses feed service', () async {
    final feed = await bloc.feed.first;

    expect(feed.first, equals(foodIncItem));
  });

  test('Feed bloc refreshes items', () async {

    // Provide other value from now on
    when(mockFeedService.getFeed()).thenAnswer((_) =>
        Future.value([kvicklyItem]));
    
    final oldFeed = await bloc.feed.first;

    await bloc.refresh();

    final newFeed = await bloc.feed.first;

    expect(oldFeed.first, equals(foodIncItem));
    expect(newFeed.first, equals(kvicklyItem));

  });
}