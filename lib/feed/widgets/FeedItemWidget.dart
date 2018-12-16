import 'package:flutter/material.dart';
import 'package:too_good_to_go/feed/models/feed_item.dart';

class FeedItemWidget extends StatelessWidget {
  final FeedItem item;
  
  const FeedItemWidget(
    this.item,
  );
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(item.companyName),
    );
  }
}
