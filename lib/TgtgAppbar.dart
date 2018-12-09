import 'package:flutter/material.dart';
import 'theme.dart';

class TGTGAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
    Container(
      height: 50.0 + MediaQuery.of(context).padding.top,
      padding: MediaQuery.of(context).padding,
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                'Too Good To Go',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: AppTheme.titleFontSize),
              ),
            ),
          )
        ],
      ),
  );
}