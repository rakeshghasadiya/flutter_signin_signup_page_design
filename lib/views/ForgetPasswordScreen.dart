import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  var divWidth;
  bool _autoValidate = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
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
            "FORGET PASSWORD",
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
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 20, top: 10, bottom: 10),
            child: InkWell(
              child: Text(
                "Login?",
                textAlign: TextAlign.end,
                style: TextStyle(color: Colors.black),
              ),
              onTap: _forgetButtonTapped,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20, left: 20, bottom: 20),
          child: SizedBox(
            child: RaisedButton(
              color: Colors.deepOrangeAccent,
              textColor: Colors.white,
              onPressed: () => _forgetPasswordButtonTapped(),
              child: Text("Forget Password"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            width: double.infinity,
          ),
        ),
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

  _forgetPasswordButtonTapped() {
    FocusScope.of(context).requestFocus(new FocusNode());
    if (_formKey.currentState.validate()) {}
  }

  _forgetButtonTapped() {
    Navigator.pop(context);
  }
}
