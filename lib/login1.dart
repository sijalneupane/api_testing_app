import 'package:api_testing_app/util/custom_dropdown.dart';
import 'package:api_testing_app/util/custom_elevatedbutton.dart';
import 'package:api_testing_app/util/custom_textformfield.dart';
import 'package:api_testing_app/util/string_const.dart';
import 'package:flutter/material.dart';

class Login1 extends StatefulWidget {
  const Login1({super.key});

  @override
  State<Login1> createState() => _Login1State();
}

class _Login1State extends State<Login1> {
  List<String> genderList = ["Male", "Female", "Others"];
  List<String> roleList = ["Admin", "User"];
  String? gender, role;
  bool visible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
           
           CustomElevatedbutton(
                child: Text(registerStr),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
   
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
