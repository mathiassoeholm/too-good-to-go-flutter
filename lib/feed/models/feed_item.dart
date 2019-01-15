import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:too_good_to_go/location/location.dart';

part 'feed_item.g.dart';

abstract class FeedItem implements Built<FeedItem, FeedItemBuilder> {
  static Serializer<FeedItem> get serializer => _$feedItemSerializer;

  @nullable
  String get companyName;

  @nullable
  String get coverImage;

  @nullable
  String get avatarImage;

  @nullable
  Location get location;

  @nullable
  int get itemsLeft;

  @nullable
  BuiltMap<String, int> get price;

  @nullable
  BuiltMap<String, int> get originalPrice;

  @nullable
  String get timeStart;

  @nullable
  String get timeEnd;

  @nullable
  int get favorites;

  @nullable
  BuiltMap<String, String> get description;

  @nullable
  String get address;

  FeedItem._();
  factory FeedItem([updates(FeedItemBuilder b)]) = _$FeedItem;
}