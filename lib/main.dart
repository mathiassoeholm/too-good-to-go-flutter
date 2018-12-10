import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme.dart';
import 'TgtgScaffold.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.white,
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Too Good To Go',
      theme: getTheme(),
      home: TgtgScaffold(),
    );
  }
}
