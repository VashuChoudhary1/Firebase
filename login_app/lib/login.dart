import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/forget.dart';
import 'package:login_app/registraion.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isloading = false;

  signIn() async {
    setState(() {
      isloading = true;
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("error msg", e.code);
    } catch (e) {
      Get.snackbar("error msg", e.toString());
    }
    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isloading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            backgroundColor: Colors.lightGreen,
            body: Center(
              child: Card(
                margin: EdgeInsets.all(15),
                elevation: 5,
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
                        "Login",
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
                          onPressed: (() => signIn()),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 15, 53, 17),
                          ),
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "New user ?  ",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          GestureDetector(
                              onTap: (() => Get.to(Registration())),
                              child: Text(
                                "Register Now",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 15),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                          onTap: (() => Get.to(Forget())),
                          child: Text("Forget password")),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
