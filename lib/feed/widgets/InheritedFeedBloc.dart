import 'package:flutter/material.dart';
import 'package:too_good_to_go/feed/feed_bloc.dart';

class InheritedFeedBloc extends InheritedWidget {
  final FeedBloc bloc;

  const InheritedFeedBloc({
    @required Widget child,
    @required this.bloc,
  }) : super(child: child);

  static InheritedFeedBloc of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(InheritedFeedBloc);
  }

  @override
  bool updateShouldNotify(InheritedFeedBloc old) {
    return bloc != old.bloc;
  }
}
