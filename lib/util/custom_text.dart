import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String data;
  Color? color;
  String? type;
  double? size;
  CustomText({super.key,required this.data,this.color,this.type,this.size});

  @override
  Widget build(BuildContext context) {
    return Text(data,style: TextStyle(color: color??Colors.black,fontSize:size??((type=="heading")?16:(type=="subHeading"?14:12) )));
  }
}