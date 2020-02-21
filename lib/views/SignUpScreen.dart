import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:login_screen/routeanimation/EnterExitRoute.dart';
import 'package:login_screen/routeanimation/FadeRoute.dart';

import 'ForgetPasswordScreen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var divWidth;
  bool _autoValidate = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmPasswordTextController = TextEditingController();
  var kMarginPadding = 16.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    divWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          LayoutBuilder(
            builder: (context, constraints) {
              return Image.asset(
                "assets/bg.jpeg",
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              );
            },
          ),
          Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  width: constraints.maxWidth<700?400:600,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(10),
                    child: Form(
                        key: _formKey,
                        autovalidate: _autoValidate,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 0.88),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: _buildEmailSignUpForm(),
                        )),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildEmailSignUpForm() {
    //Form 1
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 50.0,
          width: 145.0,
          child: Icon(
            Icons.all_inclusive,
            size: 100.0,
            color: Colors.deepOrangeAccent,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 50.0, left: 15.0, right: 15.0),
          child: Text(
            "SIGN UP TO CONTINUE",
            maxLines: 1,
          ),
        ),
        Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            margin:
                EdgeInsets.only(left: kMarginPadding, right: kMarginPadding),
            child: TextFormField(
                controller: _emailTextController,
                validator: _validateEmail,
                cursorColor: Colors.deepOrangeAccent,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.mail_outline,
                      color: Colors.black54,
                    ),
                    labelText: "Your Email*",
                    hintText: "Enter your email",
                    labelStyle: TextStyle(fontSize: 13, color: Colors.black54),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepOrangeAccent))))),
        SizedBox(
          height: 10.0,
        ),
        Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          margin: EdgeInsets.only(left: kMarginPadding, right: kMarginPadding),
          child: TextFormField(
              style: TextStyle(fontSize: kMarginPadding, color: Colors.black54),
              obscureText: true,
              validator: (String value) {
                if (value.isEmpty) {
                  return "Please enter your password";
                } else {
                  return null;
                }
              },
              cursorColor: Colors.deepOrangeAccent,
              controller: _passwordTextController,
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.lock_outline,
                    color: Colors.black54,
                  ),
                  labelText: "Your Password*",
                  hintText: "Enter a password",
                  labelStyle: TextStyle(fontSize: 13, color: Colors.black54),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrangeAccent)))),
        ),
        Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          margin: EdgeInsets.only(left: kMarginPadding, right: kMarginPadding),
          child: TextFormField(
              style: TextStyle(fontSize: kMarginPadding, color: Colors.black54),
              obscureText: true,
              validator: (String value) {
                if (value.isEmpty) {
                  return "Please enter your confirm password";
                } else if (value != _passwordTextController.text) {
                  return "Confirm password not match with password";
                } else {
                  return null;
                }
              },
              cursorColor: Colors.deepOrangeAccent,
              controller: _confirmPasswordTextController,
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.lock_outline,
                    color: Colors.black54,
                  ),
                  labelText: "Confirm Password*",
                  hintText: "Enter a confirm password",
                  labelStyle: TextStyle(fontSize: 13, color: Colors.black54),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrangeAccent)))),
        ),
        SizedBox(
           height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(right: 20, left: 20),
          child: SizedBox(
            child: RaisedButton(
              color: Colors.deepOrangeAccent,
              textColor: Colors.white,
              onPressed: () => _signUpButtonTapped(),
              child: Text("Sign Up"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            width: double.infinity,
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 15),
            child: InkWell(
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "already have an account?",
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),Padding(padding: EdgeInsets.only(left: 10)),
                  Text(
                    "Sign In!",
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 12,color: Colors.deepOrangeAccent),
                  )
                ],),
              onTap: _signInButtonTapped,
            ),
          ),
        )
      ],
    );
  }

  String _validateEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (regex.hasMatch(email))
      return null;
    else
      return "Please enter a valid email";
  }

  _signUpButtonTapped() {
    FocusScope.of(context).requestFocus(new FocusNode());
    if (_formKey.currentState.validate()) {}
  }

  _signInButtonTapped() {

    Navigator.pop(context);
  }


}
