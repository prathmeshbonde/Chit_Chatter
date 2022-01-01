import 'package:Chit_chatter/components/constants.dart';
import 'package:Chit_chatter/components/rounded_button.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  static String id = 'registrationScreen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
                height: 200.0,
                child: Image.asset('images/logo1.png'),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextFormField(
              onChanged: (value) {
                //Do something with the user input.
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
            TextFormField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kTextFieldDecoration.copyWith(
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kTextFieldDecoration.copyWith(
                labelText: 'Confirm Password',
                hintText: 'Re-enter password',
              ),
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(
              height: 28.0,
            ),
            RoundedButton(
              colour: Colors.blueAccent,
              buttonText: 'Register',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
