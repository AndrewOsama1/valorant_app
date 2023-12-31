import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:valorant_app/widgets/constant.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:valorant_app/service/register.dart';
import 'package:valorant_app/service/authentication.dart';
import 'package:valorant_app/widgets/logo_widget.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({super.key, Key? andrew});

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
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
                              const LogoWidget(),
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
                                "Please Login to Your Account",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 30),
                              _emailTextField(),
                              const SizedBox(height: 12),
                              _passwordTextField(),
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
                                                    const Register()));
                                      },
                                      child: const Text(
                                        "Dont Have an Account, Register Now",
                                        style:
                                            TextStyle(color: Colors.deepOrange),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Authentication().signInWithEmailAndPassword(
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
                                      'Login',
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

  SizedBox _emailTextField() {
    return SizedBox(
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
          color: Colors.black, // Set the text color to black
        ),
        decoration: const InputDecoration(
          suffixIcon: Icon(
            FontAwesomeIcons.envelope,
            color: kMenucolor,
          ),
          labelText: "Email Address",
          labelStyle: TextStyle(
            color: kMenucolor, // Set the text color when focused
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
              color: kMenucolor, // Set the border color when focused
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide(
              color: Colors.black, // Set the default border color
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _passwordTextField() {
    return SizedBox(
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
          color: Colors.black, // Set the text color to black
        ),
        decoration: const InputDecoration(
          suffixIcon: Icon(
            FontAwesomeIcons.eyeSlash,
            color: kMenucolor,
          ),
          labelText: "Password",
          labelStyle: TextStyle(
            color: kMenucolor, // Set the text color when focused
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
              color: kMenucolor, // Set the border color when focused
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide(
              color: Colors.black, // Set the default border color
            ),
          ),
        ),
      ),
    );
  }
}
