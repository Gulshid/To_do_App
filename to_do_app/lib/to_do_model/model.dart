import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class to_do_model {
  List to_do_list = [];
  final _box = Hive.box('to_do');

  //create initial task
  void Create_initial() {
    to_do_list = [
      ['hello', false],
      ['world', false],
    ];
  }

  //load new task
  void load_data() {
    to_do_list = _box.get('TO_DO_LIST');
  }

  //update the data
  void update_data(){
    _box.put('TO_DO_LIST', to_do_list);
  }

  void create_initial_data() {}

}
