import 'dart:async';

import 'package:too_good_to_go/feed/submodels/feed_item.dart';

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

class SelectItemAction {
  final FeedItem item;

  SelectItemAction(this.item);
}

class ClearSelectionAction { }