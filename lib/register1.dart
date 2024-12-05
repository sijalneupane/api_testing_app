import 'package:api_testing_app/util/custom_dropdown.dart';
import 'package:api_testing_app/util/custom_elevatedbutton.dart';
import 'package:api_testing_app/util/custom_textformfield.dart';
import 'package:api_testing_app/util/string_const.dart';
import 'package:flutter/material.dart';

class Register1 extends StatefulWidget {
  const Register1({super.key});

  @override
  State<Register1> createState() => _Register1State();
}

class _Register1State extends State<Register1> {
  List<String> genderList = ["Male", "Female", "Others"];
  List<String> roleList = ["Admin", "User"];
  String? gender, role;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(registerStr),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            CustomTextformfield(
              labelText: emailStr,
              suffixIcon: Icon(Icons.email),
            ),
            CustomTextformfield(labelText: usernameStr),
            CustomTextformfield(
                labelText: passwordStr,
                obscureText: true,
                suffixIcon: IconButton(
                    onPressed: () {}, icon: Icon(Icons.remove_red_eye))),
            CustomTextformfield(labelText: nameStr),
            CustomDropdown(
              labelText: genderStr,
              dropDownItemList: genderList,
              onChanged: (value) {
                gender = value;
              },
            ),
            CustomTextformfield(labelText: contactStr),
            CustomDropdown(
              labelText: roleStr,
              dropDownItemList: roleList,
              onChanged: (value) {
                role = value;
              },
            ),
            CustomElevatedbutton(
              child: Text(registerStr),
              onPressed: () {},
            )
          ],
        )),
      ),
    );
  }
}
