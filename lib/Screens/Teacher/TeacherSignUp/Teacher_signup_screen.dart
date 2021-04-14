import 'package:flutter/material.dart';
import 'package:flutter_login_purple/Screens/Student/Signup/components/body.dart';
import 'package:flutter_login_purple/Screens/Teacher/TeacherSignUp/components/body.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TeacherSignup(),
    );
  }
}