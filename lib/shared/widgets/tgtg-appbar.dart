import 'package:flutter/material.dart';
import '../theme.dart';
import 'change-color-button.dart';

class TGTGAppBar extends StatefulWidget {
  @override
  TGTGAppBarState createState() {
    return new TGTGAppBarState();
  }
}

class TGTGAppBarState extends State<TGTGAppBar> {
  @override
  Widget build(BuildContext context) => Container(
        height: 50.0 + MediaQuery.of(context).padding.top,
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            _createIconButton(Icons.menu,
              context: context,
              padding: EdgeInsets.only(left: 15, top: 10, right: 10),
              onPressed: null),
            Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text('Too Good To Go',
                style: TextStyle(
                    color: Theme.of(context).primaryTextTheme.title.color,
                    fontWeight: FontWeight.w800,
                    fontSize: AppTheme.titleFontSize),
              ),
            ),
            _createIconButton(Icons.inbox,
              context: context,
              padding: EdgeInsets.only(right: 15, top: 10, left: 10),
              onPressed: () => {}),
          ],
        ),
      );

    ChangeColorButton _createIconButton(IconData iconData, {
      BuildContext context,
      EdgeInsets padding,
      VoidCallback onPressed
    }) => ChangeColorButton(
        padding: padding,
        iconData: iconData,
        size: 35,
        onPressed: onPressed,
      );
}
