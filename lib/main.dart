import 'package:flutter/material.dart';
import 'package:login_screen/views/LoginScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      theme: ThemeData(
        accentColor: Colors.deepOrangeAccent,
      ),
      home: LoginScreen(),
    );
  }
}

