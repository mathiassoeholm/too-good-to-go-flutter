import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:too_good_to_go/appstate/app_state.dart';
import 'package:too_good_to_go/feed/submodels/feed_item.dart';
import 'package:too_good_to_go/feed/pretty_distance.dart';
import 'package:too_good_to_go/feed/widgets/favorites_button.dart';
import 'package:too_good_to_go/feed/widgets/company_avatar.dart';
import 'package:too_good_to_go/feed/widgets/on_press_overlay.dart';
import 'package:too_good_to_go/shared/theme.dart';
import 'package:too_good_to_go/shared/utilities/list_util.dart';
import 'package:too_good_to_go/location/location_selector.dart';

class FeedItemView extends StatelessWidget {
  static const blackBarHeight = 27.0;
  static const imageHeight = 140.0;
  static const whiteAreaHeight = 58.0;

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
                ..add(_buildOnPressOverlay())
              )
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

  Widget _buildOnPressOverlay() {
    return Positioned(
      top: 0, left: 0, right: 0, bottom: 0,
      child: OnPressOverlay(
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildImage() =>
    item.coverImage != null ?
        Image.network(item.coverImage,
          width: double.infinity,
          height: FeedItemView.imageHeight,
          fit: BoxFit.cover,
        ) :
        Container(
          width: double.infinity,
          height: FeedItemView.imageHeight,
        );

  Widget _buildWhiteArea() => Container(
        padding: EdgeInsets.fromLTRB(0, 12, 0, 5),
        height: FeedItemView.whiteAreaHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: ListUtil.notNullWidgets([
            item.companyName == null ? null :
              Text(item.companyName, style: AppTheme.heavyFontMedium),

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
          height: FeedItemView.blackBarHeight,
          child: FavoritesButton(favorites: item.favorites)
        );

  Widget _buildDistanceDisplay(BuildContext context) {
    return StoreConnector<AppState, double>(
      converter: (store) => distancesSelector(store.state)[item],
      builder: (context, distance) {
        return distance == null ?
          Container(width: 0, height: 0) :
          Positioned(
            top: 10,
            height: FeedItemView.blackBarHeight,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              decoration: BoxDecoration(
                  color: AppTheme.blackBarColor
              ),
              child: Center(
                child: Text(
                  prettyDistance(distance),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
      }

    );
  }

  Widget _buildAvatar() =>
    item.avatarImage == null ? null :
      Positioned(
        top: (FeedItemView.imageHeight - FeedItemView.blackBarHeight) - CompanyAvatar.radius,
        right: 0,
        left: 0,
        child: CompanyAvatar(src: item.avatarImage)
      );

  List<Widget> _buildBlackBar() => [
        Positioned(
          bottom: FeedItemView.whiteAreaHeight,
          height: FeedItemView.blackBarHeight,
          left: 0,
          right: 0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppTheme.blackBarColor,
            ),
          ),
        ),
        Positioned(
          bottom: FeedItemView.whiteAreaHeight,
          left: 8,
          right: 8,
          height: FeedItemView.blackBarHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: ListUtil.notNullWidgets([
              CircleAvatar(
                backgroundColor: Colors.greenAccent,
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
                    ).merge(AppTheme.boldFontMedium),
                  ),
                ),
            ]),
          ),
        )
      ];
}
