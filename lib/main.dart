import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:new_app/widgets/signIn.dart';
import 'package:provider/provider.dart';

import 'package:new_app/bloc/signIn_bloc.dart';
import 'Widgets/forgotPassword.dart';

void main() {
  runApp(Main());
}

// The Firstmost class to run.
class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Toaster Wrapper
    return MaterialApp(
      builder: BotToastInit(),
      title: 'Mayank Soni',
      navigatorObservers: [BotToastNavigatorObserver()],
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Localstorage instance to access localstorage
    final LocalStorage storage = new LocalStorage('localstorage_app');
    // All providers declaration here
    return MultiProvider(
      providers: [
        Provider<LoginBloc>(create: (context) => LoginBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        /**
         * Initial route according to token in localstorage. 
         * If token available home screen should show else signin screen.
         */
        initialRoute:
            storage.getItem('token') == true ? '/forgotpassword' : '/signin',
        // Routes declaration
        routes: {
          '/forgotpassword': (context) => ForgotPassword(),
          '/signin': (context) => SignIn(),
        },
        /**
         * Color(0xFF00BAC6) is showing error when assigned to primarySwitch directly, It is only accepting Colors.red type.
         * So below is the solution.
         */
        theme: ThemeData(
            primarySwatch: const MaterialColor(
          0xFF00BAC6,
          const <int, Color>{
            50: const Color(0xFF00BAC6),
            100: const Color(0xFF00BAC6),
            200: const Color(0xFF00BAC6),
            300: const Color(0xFF00BAC6),
            400: const Color(0xFF00BAC6),
            500: const Color(0xFF00BAC6),
            600: const Color(0xFF00BAC6),
            700: const Color(0xFF00BAC6),
            800: const Color(0xFF00BAC6),
            900: const Color(0xFF00BAC6),
          },
        )),
      ),
    );
  }
}
