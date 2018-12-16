import 'package:flutter/material.dart';
import 'package:too_good_to_go/shared/widgets/TgtgAppbar.dart';

class Home extends StatelessWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          TGTGAppBar(),
          Text('Hello World')
        ],
      )
    );
  }
}