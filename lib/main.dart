import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:Chit_chatter/screens/welcome_screen.dart';
import 'package:Chit_chatter/screens/login_screen.dart';
import 'package:Chit_chatter/screens/registration_screen.dart';
import 'package:Chit_chatter/screens/chat_screen.dart';

void main() => runApp(const ChitChatter());

class ChitChatter extends StatelessWidget {
  const ChitChatter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
        ChatScreen.id: (context) => const ChatScreen(),
      },
    );
  }
}
