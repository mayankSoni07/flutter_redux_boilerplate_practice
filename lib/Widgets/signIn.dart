import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  SignIn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onPressSubmit() {
      print('presses submit');
      Navigator.pushReplacementNamed(context, '/forgotpassword');
    }

    void onPressGoBack() {
      print('presses goback');
      Navigator.maybePop(context);
    }

    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Text('SIGN IN',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your username',
                  labelText: 'Enter your username'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter password',
                  labelText: 'Enter password'),
            ),
          ),
          ElevatedButton(
            child: Text('submit'),
            onPressed: onPressSubmit,
          ),
          ElevatedButton(
            child: Text('Go Back'),
            onPressed: onPressGoBack,
          )
        ],
      ),
    ));
  }
}
