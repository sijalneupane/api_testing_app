import 'package:api_testing_app/util/custom_text.dart';
import 'package:api_testing_app/util/string_const.dart';
import 'package:flutter/material.dart';

class Profile1 extends StatefulWidget {
  const Profile1({super.key});

  @override
  State<Profile1> createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(profileStr),
      ),body: Column(
        children: [
          CustomText(data:welcomeProfileStr,type: "heading",),
          Center(
            child: CustomText(data:profileBodyStr,type: "heading",),
          )
        ],
      ),
    );
  }
}