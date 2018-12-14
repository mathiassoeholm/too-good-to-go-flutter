import 'package:flutter/material.dart';
import 'theme.dart';

class TGTGAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        height: 50.0 + MediaQuery.of(context).padding.top,
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            createIconButton(Icons.menu,
              context: context,
              padding: EdgeInsets.only(left: 8),
              onPressed: null),
            Container(
              padding: EdgeInsets.only(bottom: 12),
              child: Text('Too Good To Go',
                style: TextStyle(
                    color: Theme.of(context).primaryTextTheme.title.color,
                    fontWeight: FontWeight.w800,
                    fontSize: AppTheme.titleFontSize),
              ),
            ),
            createIconButton(Icons.inbox,
              context: context,
              padding: EdgeInsets.only(right: 8),
              onPressed: null),
          ],
        ),
      );

    IconButton createIconButton(IconData iconData, {
      BuildContext context,
      EdgeInsets padding,
      VoidCallback onPressed
    }) => IconButton(
        padding: padding,
        icon: Icon(iconData, 
          size: 35,
          color: Theme.of(context).primaryTextTheme.title.color),
        onPressed: onPressed,
      );
}
