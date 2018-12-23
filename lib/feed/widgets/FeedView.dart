import 'package:flutter/material.dart';
import 'package:too_good_to_go/feed/feed_bloc.dart';
import 'package:too_good_to_go/feed/models/feed_item.dart';
import 'package:too_good_to_go/feed/widgets/FeedItemView.dart';

class FeedView extends StatelessWidget {
  final FeedBloc feedBloc;

  const FeedView({@required this.feedBloc });

  @override
  Widget build(BuildContext context) =>
    StreamBuilder<List<FeedItem>>(
      stream: feedBloc.feed,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return RefreshIndicator(
            onRefresh: feedBloc.refresh,
            child: ListView(
              padding: EdgeInsets.zero,
              children: snapshot.data.map((feedItem) =>
                FeedItemView(feedItem)
              ).toList(),
            ),
          );

        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
}
