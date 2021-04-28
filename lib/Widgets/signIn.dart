import 'package:flutter/material.dart';
import 'package:new_app/bloc/signIn_bloc.dart';
import 'package:provider/provider.dart';
import 'package:localstorage/localstorage.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LoginBloc>(context, listen: false);

    // void onPressSubmit() {
    //   print('presses submit');
    //   final LocalStorage storage = new LocalStorage('localstorage_app');
    //   storage.setItem('token', true);
    //   Navigator.pushReplacementNamed(context, '/forgotpassword');
    // }

    // void onPressGoBack() {
    //   print('presses goback');
    //   Navigator.maybePop(context);
    // }

    return Scaffold(
        body: Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 30),
                child: Text('Please Sign In to continue',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
            StreamBuilder(
              stream: bloc.loginEmail,
              builder: (context, snapshot) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextField(
                  onChanged: bloc.changeloginEmail,
                  decoration: InputDecoration(
                      errorText: snapshot.error,
                      border: OutlineInputBorder(),
                      hintText: 'Enter User ID',
                      labelText: 'User ID'),
                ),
              ),
            ),
            StreamBuilder(
              stream: bloc.loginPassword,
              builder: (context, snapshot) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextField(
                  onChanged: bloc.changeLoginPassword,
                  decoration: InputDecoration(
                      errorText: snapshot.error,
                      border: OutlineInputBorder(),
                      hintText: 'Enter Password',
                      labelText: 'Password'),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text('Forgot Password?', textAlign: TextAlign.right)),
            _submitButton(),
          ],
        ),
      ),
    ));
  }

  Widget _submitButton() {
    final bloc = Provider.of<LoginBloc>(context, listen: false);

    return StreamBuilder<Object>(
        stream: bloc.isValid,
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: snapshot.hasError || !snapshot.hasData
                ? null
                : () {
                    bloc.submit();
                  },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: snapshot.hasError || !snapshot.hasData
                      ? Colors.grey
                      : Color(0xFF00BAC6),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "SIGN IN",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
