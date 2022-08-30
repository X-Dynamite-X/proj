// ignore_for_file: unused_import, prefer_const_constructors, implementation_imports, unnecessary_import, avoid_unnecessary_containers, sized_box_for_whitespace, await_only_futures, depend_on_referenced_packages, duplicate_import, duplicate_ignore, avoid_print, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'dart:io';
import 'package:first_task/scren/login_scren.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/binding.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Logen());
  }
}
