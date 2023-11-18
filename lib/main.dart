import 'package:basics_of_flutter_30days/pages/login_page.dart';
import 'package:basics_of_flutter_30days/utils/routes.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'package:basics_of_flutter_30days/widgets/themes.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme:MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      routes:{
        "/":(context) => HomePage(),
        myRoutes.homeRoutes:(context) => HomePage(),
         myRoutes.loginRoutes:(context) => const LoginPage()
      },
    );
  }
}
