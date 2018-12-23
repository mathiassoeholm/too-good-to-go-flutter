import 'dart:async';

import 'package:location/location.dart';
import "package:test/test.dart";
import 'package:too_good_to_go/feed/feed_bloc.dart';
import 'package:too_good_to_go/feed/feed_service.dart';
import 'package:too_good_to_go/feed/models/feed_item.dart';
import 'package:mockito/mockito.dart';

import '../mocks.dart';


void main() {
  FeedItem faktaItem;
  FeedItem kvicklyItem;
  FeedService mockFeedService;
  Location mockLocation;
  FeedBloc bloc;

  final distanceBetweenFaktaAndKvickly = 44.64;

  setUp(() {
    faktaItem = FeedItem((b) => b
      ..companyName = 'Fakta'
      ..location.lat = 56.4151389
      ..location.lng = 10.8865822);

    kvicklyItem = FeedItem((b) => b
      ..companyName = 'Kvickly'
      ..location.lat = 56.4150613
      ..location.lng = 10.8872942);

    mockFeedService = MockFeedService();
    mockLocation = MockLocation();

    when(mockFeedService.getFeed()).thenAnswer((_) =>
        Future.value([faktaItem]));

    bloc = FeedBloc(feedService: mockFeedService, location: mockLocation);
  });

  test('Feed bloc uses feed service', () async {
    final feed = await bloc.feed.first;

    expect(feed.first, equals(faktaItem));
  });

  test('Feed bloc refreshes items', () async {

    // Provide other value from now on
    when(mockFeedService.getFeed()).thenAnswer((_) =>
        Future.value([kvicklyItem]));

    final oldFeed = await bloc.feed.first;

    await bloc.refresh();

    final newFeed = await bloc.feed.first;

    expect(oldFeed.first, equals(faktaItem));
    expect(newFeed.first, equals(kvicklyItem));

  });

  test('Feed bloc calculates distances', () async {
    when(mockLocation.onLocationChanged()).thenAnswer((_) => Stream.fromIterable([{
        'latitude': kvicklyItem.location.lat,
        'longitude': kvicklyItem.location.lng,
      }]));

    bloc = FeedBloc(feedService: mockFeedService, location: mockLocation);

    Map<FeedItem, num> distances = await bloc.distances.first;

    final distanceToFakta = distances[faktaItem];

    final allowedError = 1;
    expect(distanceToFakta, greaterThanOrEqualTo(distanceBetweenFaktaAndKvickly - allowedError));
    expect(distanceToFakta, lessThanOrEqualTo(distanceBetweenFaktaAndKvickly + allowedError));
  });
}