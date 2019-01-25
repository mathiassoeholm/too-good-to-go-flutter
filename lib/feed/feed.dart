import 'package:built_value/built_value.dart';
import 'package:too_good_to_go/feed/submodels/feed_item.dart';

part 'feed.g.dart';

abstract class Feed implements Built<Feed, FeedBuilder> {
  List<FeedItem> get items;

  @nullable
  FeedItem get selectedItem;

  bool get isFetching;

  @nullable
  Exception get fetchError;

  Feed._();
  factory Feed([updates(FeedBuilder b)]) =>_$Feed((b) => b
    // Default values:
    ..items = []
    ..isFetching = false
    ..update(updates)
  );
}