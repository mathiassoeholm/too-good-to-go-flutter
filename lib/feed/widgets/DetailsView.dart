import 'package:flutter/material.dart';
import 'package:too_good_to_go/feed/feed_bloc.dart';
import 'package:too_good_to_go/feed/models/feed_item.dart';
import 'package:too_good_to_go/shared/bloc_provider.dart';
import 'package:too_good_to_go/shared/utilities/list_util.dart';

class DetailsView extends StatelessWidget {

  /// Does not include the space outside of safe area.
  static const topAreaHeight = 200.0;

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
      alignment: AlignmentDirectional.topCenter,
      children: ListUtil.notNullWidgets([
        _buildImage(safeAreaTop),
        _buildStackWithSafeArea(safeAreaTop),
      ]),
    );
  }

  Widget _buildStackWithSafeArea(double safeAreaTop) {
    return Positioned(
      top: safeAreaTop,
      left:  0,
      right: 0,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: ListUtil.notNullWidgets([
          Container(
            height: topAreaHeight,
          ),
          _buildCompanyName()
        ]),
      ),
    );
  }

  Widget _buildImage(double safeAreaTop) {
    return Image.network(feedItem.coverImage,
      height: safeAreaTop + topAreaHeight,
      color: Color.fromARGB(70, 0, 0, 0),
      colorBlendMode: BlendMode.darken,
      fit: BoxFit.cover
    );
  }

  Widget _buildCompanyName() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
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
}

