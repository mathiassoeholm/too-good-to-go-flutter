import 'package:flutter/material.dart';
import 'theme.dart';

class TGTGAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        height: 50.0 + MediaQuery.of(context).padding.top,
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        padding: EdgeInsets.only(bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              'Too Good To Go',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: AppTheme.titleFontSize),
            ),
          ],
        ),
      );
}
