import 'package:flutter/material.dart';

import 'Widgets/forgotPassword.dart';
import 'Widgets/signIn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainContainer(title: 'Flutter Demo Home Page'),
    );
  }
}

class MainContainer extends StatelessWidget {
  const MainContainer({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Column(children: [SignIn(), ForgatPassword()])));
    return scaffold;
  }
}
