// ignore_for_file: unnecessary_null_comparison, avoid_print

import 'package:Chit_chatter/components/constants.dart';
import 'package:Chit_chatter/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Chit_chatter/screens/chat_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static String id = 'loginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;

  String email = "";
  String password = "";
  String errorMessage = "";

  void loginErrors(FirebaseAuthException e) {
    if (e.code == 'user-not-found') {
      errorMessage = 'Invalid user or email!';
    } else if (e.code == 'wrong-password') {
      errorMessage = 'Incorrect password!';
    } else {
      errorMessage = 'Something went wrong, try again.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'Logo',
              child: SizedBox(
                height: 240.0,
                child: Image.asset('images/logo1.png'),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                labelText: 'E-Mail',
                hintText: 'Enter your E-mail',
              ),
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(
              height: 28.0,
            ),
            RoundedButton(
              colour: Colors.lightBlueAccent,
              buttonText: 'Log In',
              onPressed: () async {
                try {
                  final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                  if (user != null) {
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                } on FirebaseAuthException catch (e) {
                  loginErrors(e);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        errorMessage,
                        style: const TextStyle(fontSize: 18.0),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      backgroundColor: Colors.red.shade400,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

/*

*/