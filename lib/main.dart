// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beginning_app/Pages/HomePage2.dart';
import 'package:flutter_beginning_app/core/Store.dart';
import 'package:flutter_beginning_app/utils/Themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'Model/CartModel.dart';
import 'Pages/CartPage.dart';
import 'package:flutter_beginning_app/utils/routes/routes.dart';
// import 'Pages/ProductDetail.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'Pages/HomePage.dart';
import 'Pages/LoginPage.dart';

void main() async {
  runApp(VxState(store: MyStore(), child: MyApp()));
  VxState.streamOf(AddMutation);
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
      initialRoute: MyRoutes.loginRoutes,

      routes: <String, WidgetBuilder>{
        "/": (context) => LoginPage(),
        MyRoutes.home2Routes: (context) => HomePage2(),
        MyRoutes.cartPage: (context) => CartPage(),
        MyRoutes.homeRoutes: (context) => HomePage(),
        MyRoutes.loginRoutes: (context) => LoginPage(),
      },
    );
  }
}
