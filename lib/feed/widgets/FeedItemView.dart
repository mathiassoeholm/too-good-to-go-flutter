import 'package:flutter/material.dart';
import 'package:too_good_to_go/feed/models/feed_item.dart';

class FeedItemView extends StatelessWidget {
  static const blackBarHeight = 25.0;

  final FeedItem item;
  
  const FeedItemView(
    this.item,
  );
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
      child: Card(
        child: Stack(
          fit: StackFit.loose,
          children: <Widget>[
            Image.network(item.coverImage,
              width: double.infinity,
              height: 140,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              height: blackBarHeight,
              left: 0,
              right: 0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black.withAlpha(150),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 5,
              height: blackBarHeight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 9,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('${item.itemsLeft} left',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}