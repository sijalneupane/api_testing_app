import 'package:api_testing_app/add_assignment.dart';
import 'package:api_testing_app/get_assignment.dart';
import 'package:api_testing_app/login1.dart';
import 'package:api_testing_app/util/setting_elevated_button.dart';
import 'package:api_testing_app/util/string_const.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(settingStr),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SettingElevatedButton(icon:Icons.add_sharp,backgroundColor: Colors.green, data:addAssignmentStr, builder: (context) =>AddAssignment() ,),
            SettingElevatedButton(icon: Icons.format_list_numbered,backgroundColor: Colors.blue, data:getAssignmentStr, builder: (context) =>GetAssignment() ,),
            SettingElevatedButton(icon:Icons.logout, data:logoutStr,backgroundColor: Colors.red,logout: true, builder: (context) =>Login1() ,)
          ],
        ),
      ),
    );
  }
}