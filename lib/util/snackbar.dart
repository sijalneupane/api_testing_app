
import 'package:flutter/material.dart';

displaySnackBar(BuildContext context,String message){
  var snackBar = SnackBar(
  content: Text(message),
  duration: Duration(seconds: 10),
);
ScaffoldMessenger.of(context).showSnackBar(snackBar);
}