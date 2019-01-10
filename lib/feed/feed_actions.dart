import 'package:too_good_to_go/feed/models/feed_item.dart';

class SetItemsAction {
  final List<FeedItem> items;

  SetItemsAction(this.items);
}