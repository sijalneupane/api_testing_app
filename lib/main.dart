import 'package:api_testing_app/add_assignment.dart';
import 'package:api_testing_app/get_assignment.dart';
import 'package:api_testing_app/login1.dart';
import 'package:api_testing_app/register1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: Register1()
      // home: AddAssignment(),
      home: Login1(),
      // home: GetAssignment(),
    );
  }
}

