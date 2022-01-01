// ignore_for_file: avoid_print

import 'package:Chit_chatter/screens/login_screen.dart';
import 'package:Chit_chatter/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:Chit_chatter/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static String id = 'welcomeScreen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  AnimationController? controller;

  Animation? animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    animation = ColorTween(
      begin: Colors.blue.shade300,
      end: Colors.white,
    ).animate(controller!);

    controller!.forward();

    controller!.addListener(() {
      setState(() {});
    });

    /* animation!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller!.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        controller!.forward();
      }
    }); */
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation!.value, //Colors.red.withOpacity(controller.value)      will fade in color from default to red .,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'Logo',
                  child: SizedBox(
                    child: Image.asset(
                      'images/logo1.png',
                    ),
                    height: 100.0, //  controller.value  increases size from 0 to 100.0 of the image.
                    // animation.value  decelerates curve from 0 to 1.
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'ChitChatter', //'${controller.value.toInt()}',          // will show loading animation from 0 to 100.
                      textStyle: const TextStyle(
                        color: Colors.blue,
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                      speed: const Duration(milliseconds: 200),
                    ),
                  ],
                  totalRepeatCount: 2,
                  stopPauseOnTap: true,
                  displayFullTextOnTap: true,
                ),
                /* const Text(
                  "ChitChatter",
                  
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ), */
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              colour: Colors.lightBlueAccent,
              buttonText: 'Log In',
              onPressed: () async {
                //Go to login screen.
                Navigator.pushNamed(context, LoginScreen.id);
                // print('Login button clicked');
              },
            ),
            RoundedButton(
              colour: Colors.blueAccent,
              buttonText: 'Register',
              onPressed: () async {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
