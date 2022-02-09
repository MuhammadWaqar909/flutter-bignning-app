import 'package:flutter/material.dart';
import 'package:flutter_beginning_app/utils/routes/routes.dart';

import 'package:google_fonts/google_fonts.dart';
import 'Pages/HomePage.dart';
import 'Pages/LoginPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
// init your dependency injection here
  runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(), this is always call below the routes
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        primaryTextTheme: GoogleFonts.latoTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(brightness: Brightness.dark),
      // this line is override all themes
      initialRoute: "/",
      routes: <String, WidgetBuilder>{
        "/":(context)=> LoginPage(),
        MyRoutes.homeRoutes: (context) => HomePage(),
        MyRoutes.loginRoutes: (context) => LoginPage(),
      },
    );
  }
}
