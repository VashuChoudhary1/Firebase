import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/home.dart';
import 'package:login_app/login.dart';
import 'package:login_app/prfile.dart';
import 'package:login_app/verify.dart';

class WrapperPage extends StatefulWidget {
  const WrapperPage({super.key});

  @override
  State<WrapperPage> createState() => _WrapperPageState();
}

class _WrapperPageState extends State<WrapperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(), // This is the spinner
              );
            }
            if (snapshot.hasData) {
              if (snapshot.data!.emailVerified) {
                return HomePage();
              } else {
                return Verify();
              }
            } else {
              return LoginPage();
            }
          }),
    );
  }
}
