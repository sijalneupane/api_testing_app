import 'package:api_testing_app/home1.dart';
import 'package:api_testing_app/profile1.dart';
import 'package:api_testing_app/settings.dart';
import 'package:api_testing_app/util/string_const.dart';
import 'package:flutter/material.dart';

class BottomNavbar1 extends StatefulWidget {
  const BottomNavbar1({super.key});

  @override
  State<BottomNavbar1> createState() => _BottomNavbar1State();
}

class _BottomNavbar1State extends State<BottomNavbar1> {
  List<Widget> widgetList=[
    Home1(),
    Profile1(),
    Settings()
  ];
  int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:widgetList[index] ,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.indigo.withOpacity(0.4),
        selectedItemColor: Colors.white,
        // selectedLabelStyle: ,
        onTap: (value) {
          setState(() {
            index=value;
          });
        },
        currentIndex: index,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label:homeStr),
        BottomNavigationBarItem(icon: Icon(Icons.person),label:profileStr),
        BottomNavigationBarItem(icon: Icon(Icons.settings),label:settingStr),
      ]
      ),
    );
  }
}