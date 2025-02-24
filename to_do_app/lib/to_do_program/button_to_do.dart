import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class dialog_button extends StatelessWidget {
  final String text;
  VoidCallback onpressed;
   dialog_button({super.key,required this.text,required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      color: Colors.yellow[200],
      child:Text(text,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),
    );
  }
}