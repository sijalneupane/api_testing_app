import 'package:api_testing_app/util/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  String? token;

  @override
  void initState() {
    super.initState();
    fetchToken();
  }

  Future<void> fetchToken() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        token = prefs.getString('authToken'); // Retrieve the token
      });
    } on Exception catch (e) {
      displaySnackBar(context, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" HOMEPAGE "),
      ),
      body: Column(
        children: [Text("Welcome to my homepage after login"), Text(token!)],
      ),
    );
  }
}
