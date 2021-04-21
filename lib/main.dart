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
      initialRoute: '/signin',
      routes: {
        '/forgotpassword': (context) => ForgotPassword(),
        '/signin': (context) => SignIn(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
