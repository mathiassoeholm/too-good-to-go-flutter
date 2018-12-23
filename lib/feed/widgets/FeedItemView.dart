import 'package:flutter/material.dart';
import 'package:too_good_to_go/feed/models/feed_item.dart';
import 'package:too_good_to_go/shared/theme.dart';

class FeedItemView extends StatelessWidget {
  static const blackBarHeight = 25.0;
  static const imageHeight = 140.0;
  static const whiteAreaHeight = 58.0;
  static const avatarRadius = 38.0;

  final FeedItem item;

  const FeedItemView(
    this.item,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
      child: Card(
        elevation: 2.0,
        child: Stack(
            fit: StackFit.loose,
            children: <Widget>[]
              ..add(_buildMainColumn())
              ..addAll(_buildBlackBar())
              ..add(_buildAvatar())),
      ),
    );
  }

  Widget _buildMainColumn() => Column(
        children: <Widget>[
          _buildImage(),
          _buildWhiteArea(),
        ],
      );

  Widget _buildImage() => Image.network(
        item.coverImage,
        width: double.infinity,
        height: imageHeight,
        fit: BoxFit.cover,
      );

  Widget _buildWhiteArea() => Container(
        padding: EdgeInsets.fromLTRB(0, 12, 0, 5),
        height: whiteAreaHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(item.companyName, style: AppTheme.heavyFontMediumSize),
            Text('${item.timeStart} - ${item.timeEnd}',
                style: AppTheme.lightFontSmall),
          ],
        ),
      );

  Widget _buildAvatar() => Positioned(
        top: (imageHeight - blackBarHeight) - avatarRadius,
        right: 0,
        left: 0,
        child: Container(
            width: avatarRadius * 2,
            height: avatarRadius * 2,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                    width: 2.0, color: Color.fromARGB(255, 210, 210, 210))),
            child: Image.network(item.avatarImage)),
      );

  List<Widget> _buildBlackBar() => [
        Positioned(
          bottom: whiteAreaHeight,
          height: blackBarHeight,
          left: 0,
          right: 0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(190),
            ),
          ),
        ),
        Positioned(
          bottom: whiteAreaHeight,
          left: 8,
          right: 8,
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
                child: Text(
                  '${item.itemsLeft} left',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  '${item.price['dkk']} DKK',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white,
                  ).merge(AppTheme.boldFontMediumSize),
                ),
              ),
            ],
          ),
        )
      ];
}
