import 'package:flutter/material.dart';

class CustomTextformfield extends StatelessWidget {
  String? labelText;
  Widget? suffixIcon;
  bool? obscureText;
  TextInputType? keyboardType;
  String? Function(String?)? validator;
  CustomTextformfield({super.key,this.labelText,this.suffixIcon,this.obscureText,this.validator,this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType:keyboardType ,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        obscureText:obscureText??false ,
        decoration: InputDecoration(
          labelText:labelText ,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5)
          )
        ),
      ),
    );
  }
}