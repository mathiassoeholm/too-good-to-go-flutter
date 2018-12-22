import 'package:flutter/material.dart';
import 'package:too_good_to_go/feed/models/feed_item.dart';

class FeedItemView extends StatelessWidget {
  final FeedItem item;
  
  const FeedItemView(
    this.item,
  );
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: <Widget>[
            Image.network(
              item.coverImage,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Text(item.companyName),
          ],
        ),
      ),
    );
  }
}
