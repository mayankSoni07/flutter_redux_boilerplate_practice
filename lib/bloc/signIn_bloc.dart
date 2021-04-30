import 'dart:async';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:new_app/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  final _loginEmail = BehaviorSubject<String>();
  final _loginPassword = BehaviorSubject<String>();

  //Getters
  Stream<String> get loginEmail => _loginEmail.stream.transform(emailValidator);
  Stream<String> get loginPassword =>
      _loginPassword.stream.transform(loginPasswordValidator);

  Stream<bool> get isValid =>
      Rx.combineLatest2(loginEmail, loginPassword, (loginEmail, pass) => true);

  //Setters
  Function(String) get changeloginEmail => _loginEmail.sink.add;
  Function(String) get changeLoginPassword => _loginPassword.sink.add;

  void submit() {
    print(_loginEmail.value);
    print(_loginPassword.value);
    signInApiCall();
  }

  void signInApiCall() async {
    Map<String, String> headers = {"app-id": "60897f35346107ed28cc411d"};
    var url = Uri.parse('https://dummyapi.io/data/api/user?limit=10');

    Response response = await http.get(url, headers: headers);
    int responseStatus = response.statusCode;
    if (responseStatus == 200) {
      String responseBody = response.body;
      print('Response status: ${responseStatus} ${responseBody}');
    } else {
      BotToast.showText(
        text: "xxxx",
        contentColor: Colors.green,
      );
    }
  }

  //Dispose
  void dispose() {
    _loginEmail.close();
    _loginPassword.close();
  }
}
