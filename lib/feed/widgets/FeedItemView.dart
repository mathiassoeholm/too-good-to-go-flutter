import 'package:flutter/material.dart';
import 'package:too_good_to_go/feed/feed_bloc.dart';
import 'package:too_good_to_go/feed/models/feed_item.dart';
import 'package:too_good_to_go/feed/widgets/FeedItemDistanceText.dart';
import 'package:too_good_to_go/feed/widgets/company_avatar.dart';
import 'package:too_good_to_go/shared/bloc_provider.dart';
import 'package:too_good_to_go/shared/theme.dart';
import 'package:too_good_to_go/shared/utilities/list_util.dart';

class FeedItemView extends StatelessWidget {
  static const blackBarHeight = 27.0;
  static const imageHeight = 140.0;
  static const whiteAreaHeight = 58.0;
  static const blackOverlayColor = Color.fromARGB(190, 0, 0, 0);

  final FeedItem item;
  final VoidCallback onPressed;

  const FeedItemView(this.item, {
      this.onPressed,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
      child: GestureDetector(
        onTap: onPressed,
        child: Card(
          elevation: 2.0,
          child: Stack(
              fit: StackFit.loose,
              children: ListUtil.notNullWidgets([]
                  ..add(_buildMainColumn())
                  ..addAll(_buildBlackBar())
                  ..add(_buildAvatar())
                  ..add(_buildFavoriteButton())
                  ..add(_buildDistanceDisplay(context))
                )
          ),
        ),
      ),
    );
  }

  Widget _buildMainColumn() => Column(
        children: <Widget>[
          _buildImage(),
          _buildWhiteArea(),
        ],
      );

  Widget _buildImage() =>
    item.coverImage != null ?
        Image.network(
          item.coverImage,
          width: double.infinity,
          height: imageHeight,
          fit: BoxFit.cover,
        ) :
        Container(
          width: double.infinity,
          height: imageHeight,
        );

  Widget _buildWhiteArea() => Container(
        padding: EdgeInsets.fromLTRB(0, 12, 0, 5),
        height: whiteAreaHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: ListUtil.notNullWidgets([
            item.companyName == null ? null :
              Text(item.companyName, style: AppTheme.heavyFontMediumSize),

            (item.timeStart ?? item.timeEnd) == null ? null :
              Text('${item.timeStart} - ${item.timeEnd}',
                style: AppTheme.lightFontSmall),

          ]),
        ),
      );

  Widget _buildFavoriteButton() =>
      item.favorites == null ? null :
        Positioned(
          right: 0,
          top: 10,
          height: blackBarHeight,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            decoration: BoxDecoration(
              color: blackOverlayColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(Icons.favorite, color: Colors.white, size: 22),
                Text('${item.favorites}',
                  style: TextStyle(
                    color: Colors.white
                  ).merge(AppTheme.boldFontSmallSize))
              ],
            ),
          ),
        );

  Widget _buildDistanceDisplay(BuildContext context) {
    final feedBloc = BlocProvider.of<FeedBloc>(context);

    return feedBloc == null ? null :
      Positioned(
      top: 10,
      height: blackBarHeight,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.0),
        decoration: BoxDecoration(
          color: blackOverlayColor
        ),
        child: Center(
          child: FeedItemDistanceText(
            feedItem: item,
            feedBloc: feedBloc,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar() =>
    item.avatarImage == null ? null :
      Positioned(
        top: (imageHeight - blackBarHeight) - CompanyAvatar.radius,
        right: 0,
        left: 0,
        child: CompanyAvatar(src: item.avatarImage)
      );

  List<Widget> _buildBlackBar() => [
        Positioned(
          bottom: whiteAreaHeight,
          height: blackBarHeight,
          left: 0,
          right: 0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: blackOverlayColor,
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
            children: ListUtil.notNullWidgets([
              CircleAvatar(
                backgroundColor: Colors.green,
                radius: 9,
              ),
              item.itemsLeft == null ? null :
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    '${item.itemsLeft} left',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              item.price == null || !item.price.containsKey('dkk') ? null :
                Expanded(
                  child: Text(
                    '${(item.price['dkk'])} DKK',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white,
                    ).merge(AppTheme.boldFontMediumSize),
                  ),
                ),
            ]),
          ),
        )
      ];
}
