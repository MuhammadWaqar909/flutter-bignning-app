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
            SizedBox(height: 20),
            // SvgPicture.asset(
            //   "assets/images/login_svg.svg",
            //   fit: BoxFit.cover,
            // ),
            Text(
              "Welcome to login page",
              style: (TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.deepPurple)),
              textScaleFactor: 2,
            ),
            SizedBox(height: 20),
          ],
        ))));
  }
}
