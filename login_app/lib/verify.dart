import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login_app/wrapper.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  void initState() {
    sendverifylink();
    super.initState();
  }

  sendverifylink() async {
    final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification().then((value) => {
          Get.snackbar("Link sent", "A link has been sent to your mail",
              margin: EdgeInsets.all(10))
        });
  }

  reload() async {
    await FirebaseAuth.instance.currentUser!
        .reload()
        .then((value) => {Get.offAll(WrapperPage())});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Verification ",
      )),
      body: Padding(
          padding: const EdgeInsets.all(28),
          child: Center(
            child: Text(
                "open you mail and click on the link provide to verify email and reload this page ..with icon at right corner"),
          )),
      floatingActionButton: FloatingActionButton(
          onPressed: (() => reload()), child: Icon(Icons.restart_alt_rounded)),
    );
  }
}
