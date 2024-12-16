//https://l.facebook.com/l.php?u=https%3A%2F%2F6a2b-2407-1400-aa0b-9848-39ee-108b-965d-7c1b.ngrok-free.app%2FcreateUser&h=AT2pVAX6aYuVyH87EIeHF7joEk8-JuW1hEaU1DCGpLEQqh_tAIfjQqXIxFECmikTFza4_YhNSbMCAWkK5_1ygxL_JbLHurZHDjYK0OXrqDc9xiEeUovxvJQ8K2WkzzgL2-rtReJfB8Lz41w&s=1

import 'package:api_testing_app/login1.dart';
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
  bool visible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(registerStr),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextformfield(
                controller: emailController,
                labelText: emailStr,
                suffixIcon: Icon(Icons.email),
              ),
              CustomTextformfield(
                controller: usernameController,
                labelText: usernameStr,
              ),
              CustomTextformfield(
                  controller: passwordController,
                  labelText: passwordStr,
                  obscureText: visible ? false : true,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          visible=!visible;
                        });
                      },
                      icon: visible
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility))),
              CustomTextformfield(
                  controller: nameController, labelText: nameStr),
              CustomDropdown(
                labelText: genderStr,
                dropDownItemList: genderList,
                onChanged: (value) {
                  gender = value;
                },
              ),
              CustomDropdown(
                labelText: roleStr,
                dropDownItemList: roleList,
                onChanged: (value) {
                  role = value;
                },
              ),
              CustomTextformfield(
                  controller: contactController, labelText: contactStr),
              CustomElevatedbutton(
                child: Text(registerStr),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>Login1()) ,(Route<dynamic> route) => false);
                  }
                },
              )
            ],
          ),
        )),
      ),
    );
  }
}
