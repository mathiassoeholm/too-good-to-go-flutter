import 'dart:async';

import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:too_good_to_go/appstate/app_state.dart';
import 'package:too_good_to_go/feed/feed_service.dart';
import 'package:location/location.dart';
import 'package:too_good_to_go/shared/utilities/url_launcher.dart';

class MockFeedService extends Mock implements FeedService { }
class MockLocation extends Mock implements Location { }
class MockMiddleware extends Mock implements MiddlewareClass<AppState> { }
class MockCompleter extends Mock implements Completer { }
class MockUrlLauncher extends Mock implements UrlLauncher { }