import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String data;
  Color? color;
  CustomText({super.key,required this.data,this.color});

  @override
  Widget build(BuildContext context) {
    return Text(data,style: TextStyle(color: color??const Color.fromARGB(255, 47, 43, 73),));
  }
}