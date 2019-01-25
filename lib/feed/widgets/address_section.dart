import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:too_good_to_go/appstate/app_state.dart';
import 'package:too_good_to_go/navigation/navigation_actions.dart';

class AddressSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {

        if (vm.address == null) {
          return Container(width: 0, height: 0);
        }

        return GestureDetector(
          onTap: () {
            showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: Text('Select navigation app'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('Google Maps'),
                    onPressed: vm.openGoogleMaps,
                  ),
                  CupertinoDialogAction(
                    child: Text('Apple Maps'),
                    onPressed: () { print('open Apple Maps'); },
                  ),
                  CupertinoDialogAction(
                    child: Text('Cancel'),
                    isDefaultAction: true,
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                  )
                ],
              ),
            );
          },
          child: Text('${vm.address}'),
        );
      }
    );
  }
}

class _ViewModel {
  final String address;
  final Function openGoogleMaps;

  _ViewModel({
    @required this.address,
    @required this.openGoogleMaps,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      address: store.state.feed.selectedItem?.address,
      openGoogleMaps: () {
        store.dispatch(OpenGoogleMapsAction(store.state.feed.selectedItem.location));
      },
    );
  }
}
