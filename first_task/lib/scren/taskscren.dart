// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, avoid_print, unused_import, non_constant_identifier_names, use_key_in_widget_constructors, implementation_imports, dead_code, avoid_unnecessary_containers, sized_box_for_whitespace, sort_child_properties_last, unrelated_type_equality_checks, unused_label, await_only_futures

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/binding.dart';

import '../chack/list_xheck.dart';
import '../chack/my_model.dart';

class TaskScren extends StatefulWidget {
  @override
  State<TaskScren> createState() => _TaskScrenState();
}

class _TaskScrenState extends State<TaskScren> {
  var my_tasks = TextEditingController();

  List<Task> tasks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              color: const Color.fromARGB(255, 136, 1, 1),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Whats needs to be done? ',
                      alignLabelWithHint: true,
                    ),
                    controller: my_tasks,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                IconButton(
                  icon: Icon(
                    Icons.add_box,
                    size: 40,
                  ),
                  onPressed: () {
                    setState(() {
                      tasks.add(Task(name: my_tasks.text));
                    });
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    child: Tasklist(tasks),
                    height: 369,
                  ),
                  // Row(children: [Text("data")],)
                ),
                SizedBox(
                  height: 30,
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete_forever,
                    size: 40,
                  ),
                  onPressed: () {
                    setState(() {
                      tasks.clear();
                    });
                  },
                ),
                SizedBox(
                  height: 50,
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

//55:0
}
