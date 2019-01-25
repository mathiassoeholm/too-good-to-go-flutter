import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:too_good_to_go/appstate/app_state.dart';
import 'package:too_good_to_go/feed/feed_actions.dart';
import 'package:too_good_to_go/feed/widgets/details_view.dart';
import 'package:too_good_to_go/feed/submodels/feed_item.dart';
import 'package:too_good_to_go/feed/widgets/feed_item_view.dart';

class FeedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
    StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        if (vm.isFetching && vm.feedItems.length == 0) {

          return Center(child: CircularProgressIndicator());

        } else {

          return CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[
              CupertinoSliverRefreshControl(
                onRefresh: vm.refresh,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return FeedItemView(vm.feedItems[index],
                      onPressed: () => vm.selectItem(context, vm.feedItems[index]),
                    );
                  },
                  childCount: vm.feedItems.length,
                ),
              )
            ],
          );

        }
      },
    );
}

class _ViewModel {
  final List<FeedItem> feedItems;
  final bool isFetching;
  final Function refresh;
  final Function(BuildContext, FeedItem) selectItem;

  _ViewModel({
    @required this.feedItems,
    @required this.isFetching,
    @required this.refresh,
    @required this.selectItem,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      feedItems: store.state.feed.items,
      isFetching: store.state.feed.isFetching,
      refresh: () {
        final action = FetchItemsAction();
        store.dispatch(action);
        return action.completer.future;
      },
      selectItem: (context, feedItem) {
        store.dispatch(SelectItemAction(feedItem));

        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailsView())
        );
      }
    );
  }
}
