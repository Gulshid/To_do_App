import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class Tile extends StatelessWidget {
  final String task_name;
  final bool task_completed;
  Function(bool?)? onChanged;
  Function(BuildContext)? delete_function;
  Tile({super.key,required this.task_name,required this.task_completed,required this.onChanged,required  this.delete_function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
                SlidableAction(onPressed: delete_function,
               icon:Icons.delete,
                backgroundColor: Colors.red,
                borderRadius: BorderRadius.circular(12.r),)
          ],),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.yellow[300],
            borderRadius: BorderRadius.circular(12.r),
          ),
        
          child: Row(
            children: [
              Checkbox(value: task_completed,
               onChanged: onChanged,
              activeColor: Colors.blue,),
              Text(task_name,style: TextStyle(
                color:Colors.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                decoration:task_completed? TextDecoration.lineThrough:TextDecoration.none),),
            ],
          ),
        ),
      ),
    );
  }
}