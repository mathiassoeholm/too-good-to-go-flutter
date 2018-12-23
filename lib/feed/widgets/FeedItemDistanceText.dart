import 'package:flutter/material.dart';
import 'package:too_good_to_go/feed/feed_bloc.dart';
import 'package:too_good_to_go/feed/models/feed_item.dart';

class FeedItemDistanceText extends StatelessWidget {
  final FeedItem feedItem;
  final FeedBloc feedBloc;

  const FeedItemDistanceText({
    @required this.feedItem,
    @required this.feedBloc,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Map<FeedItem, num>>(
      stream: feedBloc.distances,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data.containsKey(feedItem)) {
          return Text('${snapshot.data[feedItem]} m');
        } else {
          return Container();
        }
      }
    );
  }
}
