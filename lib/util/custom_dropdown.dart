import 'package:api_testing_app/util/custom_text.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  List<String> dropDownItemList;
  Function(String?)? onChanged;
  String? labelText;
  TextEditingController? controller;
  CustomDropdown(
      {super.key,
      required this.dropDownItemList,
      this.onChanged,
      this.labelText,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField(
          dropdownColor: const Color.fromARGB(255, 43, 56, 92),
          decoration: InputDecoration(
              labelText: labelText,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
          items: dropDownItemList
              .map((e) => DropdownMenuItem( value: e,child: CustomText(data: e)))
              .toList(),
          onChanged: onChanged,
          autovalidateMode:AutovalidateMode.onUserInteraction,
          validator: (value) {
          if(value==null){
            return "$labelText cannot be empty";
          }
          return null;
        }),
    );
  }
}
