import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/src/store.dart';
import 'package:too_good_to_go/appstate/app_state.dart';
import 'package:too_good_to_go/feed/submodels/feed_item.dart';
import 'package:too_good_to_go/feed/widgets/address_section.dart';
import 'package:too_good_to_go/feed/widgets/company_avatar.dart';
import 'package:too_good_to_go/feed/widgets/favorites_button.dart';
import 'package:too_good_to_go/shared/theme.dart';
import 'package:too_good_to_go/shared/utilities/list_util.dart';

class DetailsView extends StatelessWidget {

  /// Does not include the space outside of safe area.
  static const topAreaHeight = 216.0;

  static const blackBarHeight = 48.0;
  static const extraSpaceSoAvatarCanOverflow = 15.0;
  static const statusIndicatorRadius = 8.0;
  static const blackBarHorizontalPadding = 20.0;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return Material(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              _buildTop(vm.feedItem, context),
              _buildBottom(vm.feedItem, context),
            ],
          ),
        );
      }
    );
  }

  Widget _buildTop(FeedItem feedItem, BuildContext context) {
    final safeAreaTop = MediaQuery.of(context).padding.top;

    return Stack(
      overflow: Overflow.visible,
      alignment: AlignmentDirectional.topCenter,
      children: ListUtil.notNullWidgets([
        Container(
            height: safeAreaTop + topAreaHeight + extraSpaceSoAvatarCanOverflow,
            decoration: BoxDecoration(color: Colors.white),
        ),
        _buildImage(feedItem, safeAreaTop),
        _buildStackWithSafeArea(feedItem, context, safeAreaTop),
      ]),
    );
  }

  Widget _buildStackWithSafeArea(FeedItem feedItem, BuildContext context, double safeAreaTop) {
    return Positioned(
      top: safeAreaTop,
      left:  0,
      right: 0,
      child: Stack(
        overflow: Overflow.visible,
        alignment: AlignmentDirectional.center,
        children: ListUtil.notNullWidgets([
          Container(height: topAreaHeight),
          _buildCompanyName(feedItem),
          _buildBackButton(context),
          _buildBlackBar(),
          _buildAvatar(feedItem),
          _buildStatusIndicator(),
          _buildAmountLeftText(feedItem),
          _buildPriceText(feedItem),
          _buildFavoritesButton(feedItem),
          _buildOriginalPriceText(feedItem),
        ]),
      ),
    );
  }

  Widget _buildImage(FeedItem feedItem, double safeAreaTop) {
    if (feedItem.coverImage == null) {
      return Container(
          height: safeAreaTop + topAreaHeight,
          decoration: BoxDecoration(
            color: Colors.black54,
          ),
      );
    }

    return Image.network(feedItem.coverImage,
        height: safeAreaTop + topAreaHeight,
        width: double.infinity,
        color: Color.fromARGB(70, 0, 0, 0),
        colorBlendMode: BlendMode.darken,
        fit: BoxFit.cover
    );
  }

  Widget _buildCompanyName(FeedItem feedItem) {
    if (feedItem.companyName == null) {
      return null;
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
      child: Text(feedItem.companyName,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 33,
          fontWeight: FontWeight.w800,
          letterSpacing: 2
        )),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Positioned(
      top: 5,
      left: 5,
      child: IconButton(
        color: Colors.white,
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back,
          size: 32,
          color: Colors.white
        ),
      ),
    );
  }


  Widget _buildAvatar(FeedItem feedItem) {
    if (feedItem.avatarImage == null) {
      return null;
    }

    return Positioned(
      bottom: blackBarHeight/2 - CompanyAvatar.radius,
      height: CompanyAvatar.radius*2,
      right: 0,
      left: 0,
      child: CompanyAvatar(src: feedItem.avatarImage),
    );
  }

  Widget _buildBlackBar() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      height: blackBarHeight,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.blackBarColor,
        ),
      ),
    );
  }

  Widget _buildStatusIndicator() {
    return Positioned(
      left: blackBarHorizontalPadding,
      bottom: 0,
      height: blackBarHeight,
      child: CircleAvatar(
        radius: statusIndicatorRadius,
        backgroundColor: Colors.greenAccent,
      ),
    );
  }
  
  Widget _buildAmountLeftText(FeedItem feedItem) {
    if (feedItem.itemsLeft == null) {
      return null;
    }

    return Positioned(
      left: blackBarHorizontalPadding + statusIndicatorRadius*2,
      bottom: 0,
      height: blackBarHeight,
      child: Center(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text('${feedItem.itemsLeft} left',
              style: AppTheme.boldFontMedium.merge(TextStyle(
                color: Colors.white,
              )),
            ),
          )
      ),
    );
  }

  Widget _buildPriceText(FeedItem feedItem) {
    if (feedItem.price == null || !feedItem.price.containsKey('dkk')) {
      return null;
    }

    return Positioned(
      right: blackBarHorizontalPadding,
      bottom: blackBarHeight/2,
      height: blackBarHeight/2,
      child: Padding(
        padding: const EdgeInsets.only(top: 6.0),
        child: Text('${feedItem.price['dkk']} DKK',
          style: AppTheme.boldFontMediumLarge.merge(TextStyle(
              color: Colors.white,
            )),
          ),
      ),
    );
  }

  Widget _buildOriginalPriceText(FeedItem feedItem) {
    if (feedItem.originalPrice == null || !feedItem.price.containsKey('dkk')) {
      return null;
    }

    return Positioned(
      right: blackBarHorizontalPadding,
      bottom: 0,
      height: blackBarHeight/2,
      child: Center(
        child: Text('${feedItem.originalPrice['dkk']} DKK',
          style: TextStyle(
            color: Color.fromARGB(255, 150, 150, 150),
            decoration: TextDecoration.lineThrough,
          )
        ),
      )
    );
  }
  
  Widget _buildFavoritesButton(FeedItem feedItem) {
    if (feedItem.favorites == null) {
      return null;
    }

    return Positioned(
      top: 5,
      right: 0,
      height: 27,
      child: FavoritesButton(favorites: feedItem.favorites)
    );
  }

  Widget _buildBottom(FeedItem feedItem, BuildContext context) {
    return Expanded(
      child: SafeArea(
        top: false,
        child: ListView(
          padding: EdgeInsets.all(0),
          children: ListUtil.notNullWidgets([
            _buildDescription(feedItem, context),
            AddressSection(),
          ])
        ),
      ),
    );
  }

  Widget _buildDescription(FeedItem feedItem, BuildContext context) {
    if (feedItem.description == null) {
      return null;
    }

    return Column(
      children: feedItem.description.keys.map((emoji) {
        final description = feedItem.description[emoji];

        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
          child: RichText(
            text: TextSpan(
              text: '$emoji ',
              style: Theme.of(context).textTheme.title,
              children: <TextSpan>[
                TextSpan(text: description, style: Theme.of(context).textTheme.body1),
              ],
            ),
          ),
        );
      }).toList()
    );
  }
}

class _ViewModel {
  final FeedItem feedItem;

  _ViewModel({
    @required this.feedItem,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      feedItem: store.state.feed?.selectedItem ?? FeedItem(),
    );
  }
}

