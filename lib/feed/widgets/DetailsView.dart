import 'package:flutter/material.dart';
import 'package:too_good_to_go/feed/feed_bloc.dart';
import 'package:too_good_to_go/feed/models/feed_item.dart';
import 'package:too_good_to_go/feed/widgets/company_avatar.dart';
import 'package:too_good_to_go/shared/bloc_provider.dart';
import 'package:too_good_to_go/shared/utilities/list_util.dart';

class DetailsView extends StatelessWidget {

  /// Does not include the space outside of safe area.
  static const topAreaHeight = 216.0;

  static const blackBarHeight = 60.0;
  static const extraSpaceSoAvatarCanOverflow = 15.0;

  final FeedItem feedItem;

  const DetailsView(
    this.feedItem,
  );

  @override
  Widget build(BuildContext context) {
    final feedBloc = BlocProvider.of<FeedBloc>(context);

    return Material(
      child: Column(
        children: <Widget>[
          _buildTop(context),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTop(BuildContext context) {
    final safeAreaTop = MediaQuery.of(context).padding.top;

    return Stack(
      overflow: Overflow.visible,
      alignment: AlignmentDirectional.topCenter,
      children: ListUtil.notNullWidgets([
        Container(
            height: safeAreaTop + topAreaHeight + extraSpaceSoAvatarCanOverflow,
            decoration: BoxDecoration(color: Colors.white),
        ),
        _buildImage(safeAreaTop),
        _buildStackWithSafeArea(context, safeAreaTop),
      ]),
    );
  }

  Widget _buildStackWithSafeArea(BuildContext context, double safeAreaTop) {
    return Positioned(
      top: safeAreaTop,
      left:  0,
      right: 0,
      child: Stack(
        overflow: Overflow.visible,
        alignment: AlignmentDirectional.center,
        children: ListUtil.notNullWidgets([
          Container(height: topAreaHeight),
          _buildCompanyName(),
          _buildBackButton(context),
          _buildAvatar(),
        ]),
      ),
    );
  }

  Widget _buildImage(double safeAreaTop) {
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

  Widget _buildCompanyName() {
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


  Widget _buildAvatar() {
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
}

