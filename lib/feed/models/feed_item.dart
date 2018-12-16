import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:too_good_to_go/feed/models/location.dart';

part 'feed_item.g.dart';

abstract class FeedItem implements Built<FeedItem, FeedItemBuilder> {
  static Serializer<FeedItem> get serializer => _$feedItemSerializer;

  String get companyName;
  String get coverImage;
  String get avatarImage;
  Location get location;
  int get itemsLeft;
  BuiltMap<String, int> get price;
  String get timeStart;
  String get timeEnd;
  int get favorites;

  FeedItem._();
  factory FeedItem([updates(FeedItemBuilder b)]) = _$FeedItem;
}