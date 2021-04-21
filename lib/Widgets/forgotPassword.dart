import 'package:flutter/material.dart';

class ForgatPassword extends StatefulWidget {
  ForgatPassword({Key key}) : super(key: key);

  @override
  _ForgatPasswordState createState() => _ForgatPasswordState();
}

class _ForgatPasswordState extends State<ForgatPassword> {
  String email = '';

  void onChangeFunc(text) {
    print(text);
    print('emial: ' + email);
    email = text;
    setState(() {});
  }

  void onSubmit() {
    print('submitted : ' + email);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
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
          Text(email)
        ],
      ),
    );
  }
}
