import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/testing.dart';
import 'package:too_good_to_go/feed/feed_bloc.dart';
import 'package:too_good_to_go/feed/feed_service.dart';
import 'package:too_good_to_go/feed/widgets/InheritedFeedBloc.dart';
import './shared/theme.dart';
import './home/Home.dart';
import 'package:http/http.dart' as http;

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.white,
  ));

  final dummyJsonFuture = rootBundle.loadString('assets/dummy-feed.json');

  final httpClient = MockClient((request) async {
    await Future.delayed(Duration(seconds: 1));
    final json = await dummyJsonFuture;
    return http.Response(json, 200);
  });

  final feedService = FeedService(httpClient: httpClient);
  final feedBloc = FeedBloc(feedService: feedService);

  runApp(MyApp(feedBloc));
}

class MyApp extends StatelessWidget {
  final FeedBloc feedBloc;

  const MyApp(
    this.feedBloc,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Too Good To Go',
      theme: getTheme(),
      home: InheritedFeedBloc(
          bloc: feedBloc,
          child: Home()),
    );
  }
}
