import 'package:flutter/material.dart';
import 'package:too_good_to_go/feed/widgets/feed_view.dart';
import 'package:too_good_to_go/shared/widgets/tgtg-appbar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          TGTGAppBar(),
          Expanded(
            child: FeedView()
          )
        ],
      )
    );
  }
}