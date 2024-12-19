import 'package:api_testing_app/bottom_navbar1.dart';
import 'package:api_testing_app/home1.dart';
import 'package:api_testing_app/register1.dart';
import 'package:api_testing_app/util/api_const.dart';
import 'package:api_testing_app/util/custom_dropdown.dart';
import 'package:api_testing_app/util/custom_elevatedbutton.dart';
import 'package:api_testing_app/util/custom_inkwell.dart';
import 'package:api_testing_app/util/custom_textformfield.dart';
import 'package:api_testing_app/util/snackbar.dart';
import 'package:api_testing_app/util/string_const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        title: Text(loginStr),
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
                          visible = !visible;
                        });
                      },
                      icon: visible
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility))),
              CustomElevatedbutton(
                child: Text(registerStr),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    var loginDataJson = {
                      "email": emailController.text,
                      "password": passwordController.text
                    };
                    try {
                      Dio dio = Dio();
                      Response response = await dio.post(
                          ApiConst.baseUrl + ApiConst.loginApi,
                          data: loginDataJson);
                      if (response.statusCode == 200 ||
                          response.statusCode == 201) {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.setString(
                            "authToken", response.data["token"]);
                        await prefs.setBool(
                            "isLoggedIn", true);    
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => BottomNavbar1()),
                            (Route<dynamic> route) => false);

                        // String token=response.
                      } else {
                        displaySnackBar(context, loginMessageFailedStr);
                      }
                    } catch (e) {
                      displaySnackBar(context, e.toString());
                    }
                  }
                },
              ),
              CustomInkwell(data: notRegisteredStr, builder: (p0) => Register1(),)
            ],
          ),
        )),
      ),
    );
  }
}
