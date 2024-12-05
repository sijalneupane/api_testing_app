import 'package:api_testing_app/util/custom_text.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  List<String> dropDownItemList;
  Function(String?)? onChanged;
  String? labelText;
  CustomDropdown(
      {super.key,
      required this.dropDownItemList,
      this.onChanged,
      this.labelText});

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
              .map((e) => DropdownMenuItem(child: CustomText(data: e), value: e))
              .toList(),
          onChanged: onChanged),
    );
  }
}
