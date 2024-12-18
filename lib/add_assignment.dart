import 'package:api_testing_app/util/custom_dropdown.dart';
import 'package:api_testing_app/util/custom_elevatedbutton.dart';
import 'package:api_testing_app/util/custom_text.dart';
import 'package:api_testing_app/util/custom_textformfield.dart';
import 'package:api_testing_app/util/string_const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AddAssignment extends StatefulWidget {
  const AddAssignment({super.key});

  @override
  State<AddAssignment> createState() => _AddAssignmentState();
}

class _AddAssignmentState extends State<AddAssignment> {
  TextEditingController subjectController = TextEditingController();
  TextEditingController semesterController = TextEditingController();
  TextEditingController facultyController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  List<String> facultyList = ["BCA", "BIM", "CSIT"];
  List<String> semesterList = [
    "First Semester",
    "Second Semester",
    "Third Semester",
    "Fourth Semester",
    "Fifth Semester",
    "Sixth Semester",
    "Seven Semester",
    "Eight Semester"
  ];
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: CustomText(data: addAssignmentStr),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextformfield(
              labelText: subjectNameStr,
              controller: subjectController,
            ),
            CustomDropdown(
              dropDownItemList: facultyList,
              labelText: facultyStr,
              controller: facultyController,
            ),
            CustomDropdown(
              dropDownItemList: semesterList,
              labelText: semesterStr,
              controller: semesterController,
            ),
            CustomTextformfield(
              labelText: titleStr,
              controller: titleController,
            ),
            CustomTextformfield(
                labelText: descriptionStr, controller: descriptionController),
            CustomElevatedbutton(
                child: Text(
                  addAssignmentStr,
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    var addAssignmentJson={
                      "subjectName":subjectController.text,
                      "semester":semesterController.text,
                      "faculty":facultyController.text,
                      "title":titleController.text,
                      "description":descriptionController.text
                    };
                    Dio dio=Dio();
                    try {
                      Response response=await dio.post("");
                    } catch (e) {
                      
                    }
                  }
                })
          ],
        ),
      ),
    );
  }
}
