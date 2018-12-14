import 'package:flutter/material.dart';
import '../shared/TGTGAppBar.dart';

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