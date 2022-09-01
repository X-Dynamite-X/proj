// ignore: implementation_imports
// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors, must_be_immutable, avoid_print, unused_import, unused_local_variable, override_on_non_overriding_member, depend_on_referenced_packages, use_build_context_synchronously, unused_field, unused_element, prefer_final_fields, must_call_super, prefer_const_constructors_in_immutables, no_leading_underscores_for_local_identifiers, body_might_complete_normally_nullable, use_rethrow_when_possible, unnecessary_null_comparison, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_task/scren/taskscren.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Logen extends StatefulWidget {
  Logen({super.key});
  @override
  State<Logen> createState() => _LogenState();
}

final _authGoogle = FirebaseAuth.instance;

Future<void> signInWithGoogle() async {
  GoogleAuthProvider googleProvider = GoogleAuthProvider();
  googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
  googleProvider.setCustomParameters({'login_hint': 'user@example.com'});
  return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
}

class _LogenState extends State<Logen> {
  late String email;
  late String password;
  final _authEmail = FirebaseAuth.instance;
  final _authGoogle = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          titleSpacing: 20,
          title: Text(
            "Welcome My Page",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 136, 1, 1),
              fontSize: 35,
            ),
          ),
        ),
        body: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: const Color.fromARGB(255, 136, 1, 1),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      "LOGEN",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text(
                          'Entar to email: ',
                          style: TextStyle(color: Colors.white),
                        ),
                        fillColor: Colors.white,
                        icon: Icon(Icons.email, color: Colors.white),
                      ),
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text(
                            'Entar to password: ',
                            style: TextStyle(color: Colors.white),
                          ),
                          fillColor: Colors.white,
                          icon: Icon(Icons.lock, color: Colors.white),
                          prefixIcon: Icon(Icons.remove_red_eye)),
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.black,
                      height: 35.0,
                      child: MaterialButton(
                        onPressed: () async {
                          try {
                            final neuUzar =
                                await _authEmail.createUserWithEmailAndPassword(
                                    email: email, password: password);
                            print(neuUzar.user);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TaskScren()),
                            );
                          } catch (e) {
                            print(e);
                          }
                        },
                        child: const Text(
                          "Singin",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.black,
                      height: 35.0,
                      child: MaterialButton(
                        onPressed: () async {
                          try {
                            final login =
                                await _authEmail.signInWithEmailAndPassword(
                                    email: email, password: password);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TaskScren()),
                            );
                            print(login.user);
                          } catch (e) {
                            print(e);
                            // print(login);
                          }
                        },
                        child: const Text(
                          "login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.black,
                      height: 35.0,
                      child: MaterialButton(
                        onPressed: () async {
                          setState(() {
                            signInWithGoogle();
                            try {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TaskScren()),
                              );
                            } on Exception catch (e) {
                              print(e);
                            }
                          });
                        },
                        child: const Text(
                          "Singin with Google",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
    return scaffold;
  }
}
