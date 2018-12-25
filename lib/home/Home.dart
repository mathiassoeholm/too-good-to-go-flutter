import 'package:flutter/material.dart';
import 'package:too_good_to_go/feed/feed_bloc.dart';
import 'package:too_good_to_go/feed/widgets/FeedView.dart';
import 'package:too_good_to_go/shared/bloc_provider.dart';
import 'package:too_good_to_go/shared/widgets/TgtgAppbar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final feedBloc = BlocProvider.of<FeedBloc>(context);

    return Material(
      child: Column(
        children: <Widget>[
          TGTGAppBar(),
          Expanded(
            child: FeedView(
              feedBloc: feedBloc
            )
          )
        ],
      )
    );
  }
}