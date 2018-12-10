import 'package:flutter/material.dart';
import 'TGTGAppBar.dart';

class TgtgScaffold extends StatelessWidget {
  const TgtgScaffold({
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