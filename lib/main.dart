import 'package:basics_of_flutter_30days/login_page.dart';
import 'package:basics_of_flutter_30days/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'home_page.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
      //  primaryTextTheme:GoogleFonts.latoTextTheme(),
      ),
      darkTheme:ThemeData(
        brightness: Brightness.dark,
      ),
      routes:{
        "/":(context) => const LoginPage(),
        myRoutes.homeRoutes:(context) => const HomePage(),
         myRoutes.loginRoutes:(context) => const LoginPage()
      },
    );
  }
}
