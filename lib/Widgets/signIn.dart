import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  SignIn({Key key}) : super(key: key);

  void onPressSubmit() {
    print('presses submit');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: ElevatedButton(
              child: Text('submit'),
              onPressed: onPressSubmit,
            ),
          )
        ],
      ),
    );
  }
}
