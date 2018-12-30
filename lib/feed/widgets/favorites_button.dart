import 'package:flutter/material.dart';
import 'package:too_good_to_go/shared/theme.dart';

class FavoritesButton extends StatelessWidget {
  final int favorites;

  const FavoritesButton({
    this.favorites
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.0),
      decoration: BoxDecoration(
        color: AppTheme.blackBarColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(Icons.favorite, color: Colors.white, size: 22),
          Text('$favorites',
              style: TextStyle(
                  color: Colors.white
              ).merge(AppTheme.boldFontSmall))
        ],
      ),
    );
  }
}