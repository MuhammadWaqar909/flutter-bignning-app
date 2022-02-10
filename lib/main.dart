import 'package:flutter/material.dart';
import 'package:flutter_beginning_app/utils/Themes.dart';
import 'package:flutter_beginning_app/utils/routes/routes.dart';

import 'package:google_fonts/google_fonts.dart';
import 'Pages/HomePage.dart';
import 'Pages/LoginPage.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(), this is always call below the routes
      themeMode: ThemeMode.light,
      theme: MyTheme.ligthTheme(context),
      debugShowCheckedModeBanner: false,
      darkTheme: MyTheme.darkTheme(context),
      // this line is override all themes
      initialRoute: MyRoutes.homeRoutes,
      routes: <String, WidgetBuilder>{
        "/": (context) => LoginPage(),
        MyRoutes.homeRoutes: (context) => HomePage(),
        MyRoutes.loginRoutes: (context) => LoginPage(),
      },
    );
  }
}
