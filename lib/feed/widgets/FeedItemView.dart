import 'package:flutter/material.dart';
import 'package:too_good_to_go/feed/models/feed_item.dart';

class FeedItemView extends StatelessWidget {
  final FeedItem item;
  
  const FeedItemView(
    this.item,
  );
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(item.companyName),
    );
  }
}
