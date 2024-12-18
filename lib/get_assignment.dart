import 'package:api_testing_app/util/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetAssignment extends StatefulWidget {
  const GetAssignment({super.key});

  @override
  State<GetAssignment> createState() => _GetAssignmentState();
}

class _GetAssignmentState extends State<GetAssignment> {
  String? token;
  Response? response;

  @override
  void initState() {
    fetchToken();
    getAssignment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Assignment"),
      ),
      body: Column(
        children: [
          response!=null?Text(response!.data[0]["response"]):CircularProgressIndicator()
        ],
      ),
    );
  }

  getAssignment() async {
    String url =
        "https://a186-2404-7c00-49-e958-5468-4296-9c43-d01d.ngrok-free.app/getAssignment";
    if (token != null && token!.isNotEmpty) {
      url += "?token=$token"; // Append token as a query parameter
    }
    Dio dio = Dio();
    response = await dio.get(url);
  }
  fetchToken() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        token = prefs.getString('authToken'); // Retrieve the token
      });
    } on Exception catch (e) {
      displaySnackBar(context, e.toString());
    }
  }
}
