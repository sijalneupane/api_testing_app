import 'package:api_testing_app/util/api_const.dart';
import 'package:api_testing_app/util/custom_text.dart';
import 'package:api_testing_app/util/snackbar.dart';
import 'package:api_testing_app/util/string_const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetAssignment extends StatefulWidget {
  const GetAssignment({super.key});

  @override
  State<GetAssignment> createState() => _GetAssignmentState();
}

class _GetAssignmentState extends State<GetAssignment> {
  Response? response;
  @override
  void initState() {
    getAssignment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(getAssignmentStr),
      ),
      body: response != null
          ? Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: response?.data["list"].length,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Card(
                          color: const Color.fromARGB(255, 201, 194, 194),
                          child:Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CustomText(data: response?.data["list"][index]["title"],type: "heading",),
                                    Spacer(),
                                    CustomText(data: response?.data["list"][index]["subjectName"],type: "heading",),
                                  ],
                                ),Divider(color: Colors.blue,),
                                CustomText(data: response?.data["list"][index]["faculty"],type: "subHeading",),
                                CustomText(data: response?.data["list"][index]["semester"],type: "subHeading",),
                                CustomText(data: response?.data["list"][index]["description"],),
                              ],
                            ),
                          ) ,
                        ),
                      );
                    }),
                )
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Colors.red,
                  ),SizedBox(height: 20,),
                  Text("Loading...")
                ],
              ),
            ),
    );
  }

  getAssignment() async {
    Dio dio = Dio();
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString("authToken"); // Retrieve the token
      if (token != null && token.isNotEmpty) {
        // url += "?token=$token"; // Append token as a query parameter
        dio.options.headers["Authorization"] = "Bearer $token";
      }
      String url = ApiConst.baseUrl + ApiConst.getAssignmentApi;
      response = await dio.get(url);
      setState((){
        response;
      });
    } catch (e) {
      displaySnackBar(context, e.toString());
    }
  }
}
