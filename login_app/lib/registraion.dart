import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/login.dart';
import 'package:login_app/wrapper.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  signup() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text, password: password.text);
    Get.offAll(WrapperPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Center(
        child: Card(
          margin: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: Colors.black,
              width: 2.0,
            ),
          ),
          child: SizedBox(
            height: 400,
            width: 400,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Registration",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 45,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(20),
                  width: 400,
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.black, width: 5)),
                      //hintText: "Email",
                      labelText: " Email",
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.all(20),
                  width: 400,
                  child: TextField(
                    controller: password,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.black, width: 5)),
                      //hintText: "Email",
                      labelText: " Password",
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                    onPressed: (() => signup()),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 15, 53, 17),
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
