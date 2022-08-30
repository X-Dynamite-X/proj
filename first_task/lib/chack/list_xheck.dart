// ignore_for_file: must_be_immutable, camel_case_types, prefer_const_constructors, avoid_print, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, non_constant_identifier_names, prefer_typing_uninitialized_variables, override_on_non_overriding_member, unused_import

import "package:flutter/material.dart";

import 'add_task.dart';
import 'my_model.dart';

class Tasklist extends StatefulWidget {
  final List<Task> tasks;
  Tasklist(this.tasks);
  @override
  State<Tasklist> createState() => _TasklistState();
}

class _TasklistState extends State<Tasklist> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(
              isChecked: widget.tasks[index].isDone,
              taskTitel: widget.tasks[index].name,
              CheckboxChange: (newValue) {
                setState(() {
                  widget.tasks[index].donechange();
                });
              });
        });
  }
}
