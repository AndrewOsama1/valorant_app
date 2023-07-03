import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:valorant_app/constant.dart';
import 'package:valorant_app/homepage.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:valorant_app/login.dart';
import 'package:valorant_app/service/authentication.dart';

class Register extends StatefulWidget {
  const Register({super.key, Key? andrew});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  void click() {}

  bool showSpinner = false;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/vaaa.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(height: 50),
                        const SizedBox(height: 10),
                        Container(
                          width: 325,
                          height: 470,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Homepage()));
                                },
                                child: Image.asset(
                                  'assets/images/valorantlogo.png',
                                  height: 110,
                                  width: 110,
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                "Hello",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "Sign Up Now",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 30),
                              SizedBox(
                                width: 260,
                                height: 60,
                                child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  textAlign: TextAlign.center,
                                  onChanged: (value) {
                                    email = value;
                                  },
                                  cursorColor: kMenucolor,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  decoration: const InputDecoration(
                                    suffixIcon: Icon(
                                      FontAwesomeIcons.envelope,
                                      color: kMenucolor,
                                    ),
                                    labelText: "Email Address",
                                    labelStyle: TextStyle(
                                      color: kMenucolor,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                      borderSide: BorderSide(
                                        color: kMenucolor,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              SizedBox(
                                width: 260,
                                height: 60,
                                child: TextField(
                                  obscureText: true,
                                  textAlign: TextAlign.center,
                                  onChanged: (value) {
                                    password = value;
                                  },
                                  cursorColor: kMenucolor,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  decoration: const InputDecoration(
                                    suffixIcon: Icon(
                                      FontAwesomeIcons.eyeSlash,
                                      color: kMenucolor,
                                    ),
                                    labelText: "Password",
                                    labelStyle: TextStyle(color: kMenucolor),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                      borderSide: BorderSide(
                                        color: kMenucolor,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 30, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginApp()));
                                      },
                                      child: const Text(
                                        "Already Have an Account, Login Now",
                                        style:
                                            TextStyle(color: Colors.deepOrange),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Authentication().signUpWithEmailAndPassword(
                                      email, password, context);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 250,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    color: kMenucolor,
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Text(
                                      'Register',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
