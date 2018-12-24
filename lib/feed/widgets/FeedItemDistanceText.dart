import 'package:flutter/material.dart';
import 'package:too_good_to_go/feed/feed_bloc.dart';
import 'package:too_good_to_go/feed/models/feed_item.dart';

class FeedItemDistanceText extends StatelessWidget {
  final FeedItem feedItem;
  final FeedBloc feedBloc;
  final TextStyle style;

  const FeedItemDistanceText({
    @required this.feedItem,
    @required this.feedBloc,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Map<FeedItem, num>>(
      stream: feedBloc.distances,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data.containsKey(feedItem)) {
          return Text(_prettyDistance(snapshot.data[feedItem]), style: style);
        } else {
          return Container();
        }
      }
    );
  }

  String _prettyDistance(num distance) {
    if (distance >= 1000) {
      var stringNum = (distance.round() / 1000).toStringAsFixed(1);
      stringNum = stringNum.replaceAll('.0', '');

      return '$stringNum km';
    } else {
      return '${distance.round()} m';
    }
  }
}
