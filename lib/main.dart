// @dart=2.9
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showmarket/screens//Karsilama2.dart';
import 'package:showmarket/screens/girissayfasi.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

String userId = '';
String usernameSession = '';
String passwordSave = '';

class _MyAppState extends State<MyApp> {
  void getSession() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('sessionId').toString();
    usernameSession = prefs.getString('usernameSession').toString();
    passwordSave = prefs.getString('passwordSave').toString();
    print(userId + "denme");
  }

  @override
  void initState() {
    super.initState();
    getSession();
    if (!userId.isEmpty || !usernameSession.isEmpty || !passwordSave.isEmpty) {
      loginUniversal(usernameSession, passwordSave, context);
    } else {
      Timer(
          Duration(seconds: 3),
          () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Karsilama2())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/splashscreen.jpeg"), fit: BoxFit.fill),
        ),
      ),
    );
  }
}
