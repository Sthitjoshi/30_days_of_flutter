import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final int days =30;
  final String name ="Sthita";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text("Welcome to my App"),
      ),
      body: Center(
        child: Text("Welcome to $days days flutter with $name"),
      ),
    );
  }
}
