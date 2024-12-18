import 'package:flutter/material.dart';

class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" HOMEPAGE "),
      ),
      body: Column(
        children: [
          Text("Welcome to my homepage after login")
        ],
      ),
    );
  }
}