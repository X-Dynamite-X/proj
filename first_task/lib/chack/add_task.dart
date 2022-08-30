// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, empty_constructor_bodies, prefer_const_constructors_in_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitel;
  final void Function(bool?) CheckboxChange;
  TaskTile(
      {required this.isChecked,
      required this.taskTitel,
      required this.CheckboxChange});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListTile(
        title: Text(
          taskTitel,
          style:
              TextStyle(color: Color.fromARGB(255, 136, 1, 1), fontSize: 35.0),
        ),
        trailing: Container(
          color: Color.fromARGB(255, 136, 1, 1),
          child: Checkbox(
            value: isChecked,
            onChanged: CheckboxChange,
            activeColor:Colors.black,
            checkColor:  Color.fromARGB(255, 136, 1, 1),
            hoverColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
