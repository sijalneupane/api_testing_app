import 'package:api_testing_app/util/snackbar.dart';
import 'package:api_testing_app/util/string_const.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        title: Text(homeStr),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text(welcomeHomeStr,style: TextStyle(fontSize: 30),textAlign: TextAlign.center,)),
        ],
      ),
    );
  }
}
