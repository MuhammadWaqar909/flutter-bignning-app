// import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Container(
            child: Center(
                child: Column(
          children: [
            Image.asset(
              "assets/images/login_image.png",
              fit: BoxFit.cover,
            ),
            Text(
              "Welcome to login page",
              style: (TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.deepPurple)),
              textScaleFactor: 1.5,
            ),
            SizedBox(height: 20),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0 , horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter Your Name", labelText: "User Name"),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter password", labelText: "Password"),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(onPressed:(){}, child: Text("Login"))

                  ],
                )
            )


          ],
        ))));
  }
}
