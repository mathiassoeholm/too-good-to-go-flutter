import 'package:built_value/built_value.dart';
import 'package:too_good_to_go/feed/feed.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  Feed get feed;

  AppState._();
  factory AppState([updates(AppStateBuilder b)]) =>_$AppState((b) => b
    // Default values:
    ..feed = Feed().toBuilder()
    ..update(updates)
  );
}