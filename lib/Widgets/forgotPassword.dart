import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String email = '';

  void onChangeFunc(text) {
    print(text);
    print('emial: ' + email);
    email = text;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    void onSubmit() {
      print('submitted : ' + email);
      Navigator.pushNamed(context, '/signin');
    }

    void onPressGoBack() {
      print('presses goback');
      Navigator.maybePop(context);
    }

    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Text('FORGOT PASSWORD',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              onChanged: onChangeFunc,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Email',
                  labelText: 'Enter Email'),
            ),
          ),
          ElevatedButton(onPressed: onSubmit, child: Text('Submit')),
          Text(email),
          ElevatedButton(
            child: Text('Go Back'),
            onPressed: onPressGoBack,
          )
        ],
      ),
    ));
  }
}
