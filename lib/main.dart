import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/testing.dart';
import 'package:location/location.dart';
import 'package:redux/redux.dart';
import 'package:too_good_to_go/appstate/app_state.dart';
import 'package:too_good_to_go/appstate/app_state_middleware.dart';
import 'package:too_good_to_go/appstate/app_state_reducer.dart';
import 'package:too_good_to_go/feed/feed_service.dart';
import './shared/theme.dart';
import 'package:too_good_to_go/home/widgets/home.dart';
import 'package:http/http.dart' as http;

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.white,
  ));

  final random = Random();
  final dummyJson1Future = rootBundle.loadString('assets/dummy-feed1.json');
  final dummyJson2Future = rootBundle.loadString('assets/dummy-feed2.json');

  final httpClient = MockClient((request) async {
    await Future.delayed(Duration(seconds: 1));
    final json = await (random.nextBool() ? dummyJson1Future : dummyJson2Future);
    final headers = {
      'content-type': 'application/json; charset=utf-8',
    };

    return http.Response(json, 200, headers: headers);
  });

  final feedService = FeedService(httpClient: httpClient);
  final location = Location();

  // Trigger permission popup
  location.getLocation();

  final Store<AppState> store = Store<AppState>(
    appStateReducer,
    initialState: AppState(),
    middleware: createAppStateMiddleware(feedService)
  );

  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp(
    this.store,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Too Good To Go',
        theme: getTheme(),
        home: Home(),
      ),
    );
  }
}
