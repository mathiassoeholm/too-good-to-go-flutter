import 'package:flutter/material.dart';
import 'package:too_good_to_go/feed/widgets/details_view.dart';
import 'package:too_good_to_go/feed/feed_bloc.dart';
import 'package:too_good_to_go/feed/models/feed_item.dart';
import 'package:too_good_to_go/feed/widgets/feed_item_view.dart';

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
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return _buildFeedItemView(context, snapshot.data[index]);
              },
            ),
          );

        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );

  Widget _buildFeedItemView(BuildContext context, FeedItem feedItem) =>
    FeedItemView(feedItem,
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailsView(feedItem))
      )
    );
}
