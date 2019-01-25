import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:too_good_to_go/appstate/app_state.dart';
import 'package:too_good_to_go/feed/feed_actions.dart';

class DetailsBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Function>(
      converter: (store) => () {
        store.dispatch(ClearSelectionAction());
        Navigator.pop(context);
      },
      builder: (builder, onPressed) {
        return Positioned(
          top: 5,
          left: 5,
          child: IconButton(
            color: Colors.white,
            onPressed: () => onPressed(),
            icon: Icon(Icons.arrow_back,
                size: 32,
                color: Colors.white
            ),
          ),
        );
      }
    );
  }
}
