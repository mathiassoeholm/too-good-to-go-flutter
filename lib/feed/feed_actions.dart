import 'dart:async';

import 'package:too_good_to_go/feed/models/feed_item.dart';

class FetchItemsAction {
  final Completer completer;

  FetchItemsAction({ Completer completer })
      : this.completer = completer ?? new Completer();
}

class FetchItemsFailedAction {
  final Exception error;

  FetchItemsFailedAction(this.error);
}

class FetchItemsSucceededAction {
  final List<FeedItem> items;

  FetchItemsSucceededAction(this.items);
}