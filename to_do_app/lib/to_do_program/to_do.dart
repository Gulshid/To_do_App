// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/to_do_model/model.dart';
import 'package:to_do_app/to_do_program/Alert_box.dart';
import 'package:to_do_app/to_do_program/Tile.dart';

class to_do extends StatefulWidget {
  const to_do({super.key});

  @override
  State<to_do> createState() => _to_doState();
}

class _to_doState extends State<to_do> {
  //reference the hive database box
  final _box = Hive.box('TO_DO');
  //list of to do task
  to_do_model db = to_do_model();
  void initState() {
    if (_box.get('TO_DO_LIST') == null) {
      db.Create_initial();
    } else {
      db.load_data();
    }
    super.initState();
  }

  //text controller
  final _controller = TextEditingController();

  //function for checkbox
  void Check_Box_change(bool? value, int index) {
    setState(() {
      db.to_do_list[index][1] = !db.to_do_list[index][1];
    });
    db.update_data();
  }

  //function for save new task
  void Save_new_task() {
    setState(() {
      db.to_do_list.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.update_data();
  }

  //function for create new task
  void create_new_task() {
    showDialog(
      context: context,
      builder: (context) {
        return Alert_box(
          controller: _controller,
          onsave: Save_new_task,
          oncancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //function for delete task
  void delete_Task(int index) {
    setState(() {
      db.to_do_list.removeAt(index);
    });
    db.update_data();
  }

  // ignore: annotate_overrides
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[100],
      appBar: AppBar(
        title: Center(child: Text('To Do APP')),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
        ),
        backgroundColor: const Color.fromARGB(255, 188, 145, 199),
        onPressed: () {
          create_new_task();
        },
        child: Icon(Icons.add,size: 30,),
      ),
      body: ListView.builder(
        itemCount: db.to_do_list.length,
        itemBuilder: (context, index) {
          return Tile(
            task_name: db.to_do_list[index][0],
            task_completed: db.to_do_list[index][1],
            onChanged: (value) => Check_Box_change(value, index),
            delete_function: (context) => delete_Task(index),
          );
        },
      ),
    );
  }
}
