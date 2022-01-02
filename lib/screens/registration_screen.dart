// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'package:Chit_chatter/components/constants.dart';
import 'package:Chit_chatter/components/rounded_button.dart';
import 'package:Chit_chatter/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  static String id = 'registrationScreen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  String email = "";
  String password = "";
  String cpassword = "";
  String errorMessage = "";

  bool showSpinner = false;
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
  }

  void signupErrors(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      errorMessage = "Password provided is too weak. It should be of minimum 6 characters";
    } else if (e.code == 'email-already-in-use') {
      errorMessage = "Account already exists for this email.";
    } else {
      errorMessage = "Something Went Wrong. Try again!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'Logo',
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset('images/logo1.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  labelText: 'E-mail',
                  hintText: 'Enter your E-mail',
                ),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                obscureText: _isObscure,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  suffixIcon: IconButton(
                    icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                obscureText: _isObscure,
                onChanged: (value) {
                  cpassword = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  labelText: 'Confirm Password',
                  hintText: 'Re-enter password',
                  suffixIcon: IconButton(
                    icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(
                height: 28.0,
              ),
              RoundedButton(
                colour: Colors.blueAccent,
                buttonText: 'Register',
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    if (password == cpassword) {
                      final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                      if (newUser != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Password don't match!",
                            style: TextStyle(fontSize: 18.0),
                          ),
                          backgroundColor: Color(0xFFBBDEFB),
                        ),
                      );
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  } on FirebaseAuthException catch (e) {
                    signupErrors(e);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          errorMessage,
                          style: const TextStyle(fontSize: 18.0),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        backgroundColor: const Color(0xFFBBDEFB),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
