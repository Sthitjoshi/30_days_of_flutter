import 'package:basics_of_flutter_30days/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Sthita";

  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white54,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title:const Text(
            "Catalog App",
         // textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Text("Welcome to $days days of flutter by $name"),

      ),
      drawer: const MyDrawer(),
    );
  }
}

