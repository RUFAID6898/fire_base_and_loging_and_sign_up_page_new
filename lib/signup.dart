import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_fire_base_and_loging_and_sign_up_page/homepage.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  TextEditingController _namecontroller = TextEditingController();

  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _confompasswordcontroller = TextEditingController();

  void authhh(BuildContext context) async {
    final email = _emailcontroller.text;
    final password = _passwordcontroller.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      return FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
        (value) {
          Navigator.pop(context);
        },
      );
    } else {
      alert(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
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
                  'SIGIN UP',
                  style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 163, 11, 234),
                      fontStyle: FontStyle.italic),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _namecontroller,
                    decoration: InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _emailcontroller,
                    decoration: InputDecoration(
                        hintText: ' Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    obscureText: true,
                    maxLength: 10,
                    controller: _passwordcontroller,
                    decoration: InputDecoration(
                        hintText: 'password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    maxLength: 10,
                    obscureText: true,
                    controller: _confompasswordcontroller,
                    decoration: InputDecoration(
                        hintText: 'Conform password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      authhh(context);
                    },
                    child: const Text('SIGN UP')),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Back'))
              ],
            ),
          ],
        ),
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
