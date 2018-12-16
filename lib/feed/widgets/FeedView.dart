import 'package:flutter/material.dart';
import 'package:too_good_to_go/feed/models/feed_item.dart';
import 'package:too_good_to_go/feed/widgets/FeedItemView.dart';

class FeedView extends StatelessWidget {
  final Future<List<FeedItem>> feedFuture;

  const FeedView(this.feedFuture);

  @override
  Widget build(BuildContext context) =>
    FutureBuilder<List<FeedItem>>(
      future: feedFuture,
      initialData: null,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {

          return ListView(
            children: snapshot.data.map((feedItem) =>
              FeedItemView(feedItem)
            ).toList(),
          );

        } else {

          return CircularProgressIndicator();

        }
      },
    );
}
