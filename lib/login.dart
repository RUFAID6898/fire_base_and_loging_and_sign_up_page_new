import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_fire_base_and_loging_and_sign_up_page/homepage.dart';
import 'package:flutter_application_fire_base_and_loging_and_sign_up_page/signup.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  Future authhh(BuildContext context) async {
    String email = _emailcontroller.text;
    String password = _passwordcontroller.text;

    {
      if (email.isNotEmpty && password.isNotEmpty) {
        try {
          await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password)
              .then((value) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ));
          });
        } on FirebaseException catch (error) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(error.message.toString()),
          ));
        }
      } else {
        alert(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 89, 87, 87),
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
          const Text(
            'LOGIN',
            style: TextStyle(
                fontSize: 25,
                color: Color.fromARGB(255, 163, 11, 234),
                fontStyle: FontStyle.italic),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _emailcontroller,
              decoration: InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              // obscureText: true,
              controller: _passwordcontroller,
              decoration: InputDecoration(
                  hintText: 'password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {}, child: Text('Forget Passoword ?'))
            ],
          ),
          ElevatedButton(
              onPressed: () {
                authhh(context);
              },
              child: const Text('LOGIN')),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUp(),
                    ));
              },
              child: const Text('SIGN UP')),
        ],
      ),
    );
  }

  void alert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('please enter email and password'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close'))
          ],
        );
      },
    );
  }
}
