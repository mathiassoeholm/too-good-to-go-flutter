import 'dart:convert';
import 'package:too_good_to_go/feed/submodels/feed_item.dart';
import 'package:too_good_to_go/serialization/serializers.dart';

List<FeedItem> parseFeedJson(String jsonString) {
  final jsonObject = json.decode(jsonString);
  return (jsonObject as List)
      .map((f) => standardSerializers.deserializeWith(FeedItem.serializer, f))
      .toList(growable: false);
}