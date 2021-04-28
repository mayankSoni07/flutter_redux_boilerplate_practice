import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:new_app/widgets/signIn.dart';
import 'package:provider/provider.dart';

import 'package:new_app/bloc/signIn_bloc.dart';
import 'Widgets/forgotPassword.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final LocalStorage storage = new LocalStorage('localstorage_app');
    return MultiProvider(
      providers: [
        Provider<LoginBloc>(create: (context) => LoginBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        initialRoute:
            storage.getItem('token') == true ? '/forgotpassword' : '/signin',
        routes: {
          '/forgotpassword': (context) => ForgotPassword(),
          '/signin': (context) => SignIn(),
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
