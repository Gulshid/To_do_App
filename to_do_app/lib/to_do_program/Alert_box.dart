import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/to_do_program/button_to_do.dart';

// ignore: must_be_immutable
class Alert_box extends StatelessWidget {
  final controller;
  VoidCallback onsave;
  VoidCallback oncancel;

  Alert_box({super.key, required this.controller,required this.onsave,required this.oncancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text('Create New Task',style: TextStyle(fontSize: 20.sp,color: Colors.black),)),
      backgroundColor: const Color.fromARGB(255, 114, 85, 167),
      content: Container(
        height: 250.h,
        width: 250.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              style: TextStyle(color: Colors.black),
              controller: controller,
              decoration: InputDecoration(
                labelText: 'Enter the Task here',labelStyle: TextStyle(fontSize: 20.sp,color: Colors.blue),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                dialog_button(text: 'Save', onpressed: onsave),
                SizedBox(width: 20.w),
                //Cancel button
                dialog_button(text: 'Cancel', onpressed:oncancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}