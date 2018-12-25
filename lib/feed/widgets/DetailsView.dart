import 'package:flutter/material.dart';
import 'package:too_good_to_go/feed/feed_bloc.dart';
import 'package:too_good_to_go/feed/models/feed_item.dart';
import 'package:too_good_to_go/shared/bloc_provider.dart';

class DetailsView extends StatelessWidget {
  final FeedItem feedItem;

  const DetailsView(
    this.feedItem,
  );

  @override
  Widget build(BuildContext context) {
    final feedBloc = BlocProvider.of<FeedBloc>(context);

    return Text(feedItem.companyName);
  }
}

