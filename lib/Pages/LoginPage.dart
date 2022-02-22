// import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beginning_app/utils/routes/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool focusInput = false;
  final _formKey = GlobalKey<FormState>();

  Future movetoHome(BuildContext context) async {
    print('out Condition ....');
    if (_formKey.currentState!.validate()) {
      print('In Condition ....');
      setState(() => {
            focusInput = true,
          });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.home2Routes);
      setState(() => {
            focusInput = false,
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/login_image.png",
                      fit: BoxFit.cover,
                    ),
                    Text(
                      focusInput ? "Welcome to $name" : "Welcome to login page",
                      style: (TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.deepPurple)),
                      textScaleFactor: 1.5,
                    ),
                    SizedBox(height: 20),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 32.0),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Enter Your Name",
                                  labelText: "User Name"),
                              validator: (value) {
                                if (value != null && value.isEmpty) {
                                  return "Name field should not be empty";
                                }
                                return null;
                              },
                              onChanged: (value) => {name = value},
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Enter password",
                                  labelText: "Password"),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Name field should not be empty";
                                } else if (value.length < 6) {
                                  return "Please enter password atleast 6 character";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 30),
                            Material(
                              color: Colors.deepPurple,
                              borderRadius:
                                  BorderRadius.circular(focusInput ? 60 : 8),
                              child: InkWell(
                                onTap: () => movetoHome(context),
                                child: AnimatedContainer(
                                  duration: Duration(seconds: 1),
                                  width: focusInput ? 50 : 150,
                                  height: 50,
                                  alignment: Alignment.center,
                                  child: focusInput
                                      ? Icon(
                                          Icons.done,
                                          color: Colors.white,
                                        )
                                      : Text(
                                          "Login",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                          ),
                                        ),
                                ),
                              ),
                            )
                          ],
                        ))
                  ],
                ))));
  }
}
