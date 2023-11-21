import 'package:flutter/material.dart';
import 'package:payment_exploration/views/login.dart';
import 'package:payment_exploration/views/signup.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool signedUp = false;

  @override
  Widget build(BuildContext context) {
    return signedUp ? const SignupPage() : LoginPage(onLogin: (status) {});
  }
}
