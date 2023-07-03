import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:valorant_app/service/login.dart';

import '../widgets/constant.dart';
import '../screens/homepage.dart';

class Authentication {
  // For Authentication related functions you need an instance of FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //  It will be used to check if the user is logged in or not.
  Stream<User?> get authStateChange => _auth.authStateChanges();

  Future<void> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Homepage()));
    } catch (e) {
      await QuickAlert.show(
        confirmBtnColor: kMenucolor,
        confirmBtnTextStyle: const TextStyle(
            fontFamily: 'valorant', fontSize: 40, color: Colors.white),
        customAsset: 'assets/images/giphy.gif',
        context: context,
        type: QuickAlertType.error,
        title: 'Oops... Login Failed',
        text: 'The Email or The Password You Tried to Enter is Incorrect',
      );
    }
  }

  // SignUp the user using Email and Password
  Future<void> signUpWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (newUser != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginApp()),
        );
      }
    } catch (e) {
      await QuickAlert.show(
        confirmBtnColor: kMenucolor,
        confirmBtnTextStyle: const TextStyle(
            fontFamily: 'valorant', fontSize: 40, color: Colors.white),
        customAsset: 'assets/images/gip.gif',
        context: context,
        type: QuickAlertType.warning,
        title: 'Oops... Register Failed',
        text: 'The Email You Tried to Enter is Already in Use',
      );
    }
  }

  Future<void> signOut(BuildContext context) async {
    await QuickAlert.show(
      confirmBtnColor: kMenucolor,
      onConfirmBtnTap: () {
        _auth.signOut();
        Navigator.of(context).pop();
      },
      confirmBtnTextStyle: const TextStyle(
          fontFamily: 'valorant', fontSize: 20, color: Colors.white),
      cancelBtnTextStyle: const TextStyle(
          fontFamily: 'valorant', fontSize: 20, color: kMenucolor),
      customAsset: 'assets/images/gip.gif',
      context: context,
      type: QuickAlertType.confirm,
      title: 'Are you sure you want to sign out?',
    );
  }
}
