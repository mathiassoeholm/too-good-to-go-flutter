import 'package:flutter/material.dart';
import 'package:too_good_to_go/feed/widgets/FeedView.dart';
import 'package:too_good_to_go/feed/widgets/InheritedFeedBloc.dart';
import 'package:too_good_to_go/shared/widgets/TgtgAppbar.dart';

class Home extends StatelessWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final inheritedFeedBloc = InheritedFeedBloc.of(context);

    return Material(
      child: Column(
        children: <Widget>[
          TGTGAppBar(),
          FeedView(feedBloc: inheritedFeedBloc.bloc)
        ],
      )
    );
  }
}