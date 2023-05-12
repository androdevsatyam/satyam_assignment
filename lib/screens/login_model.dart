import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:satyam_assignment/app_resources.dart';
import 'package:satyam_assignment/models/user_data.dart';
import 'package:satyam_assignment/screens/signup.dart';
import 'package:satyam_assignment/screens/welcome.dart';
import 'package:stacked/stacked.dart';

import '../global.dart';
import 'home.dart';

class LoginModel extends BaseViewModel {
  late UserData info;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool hidepass = true;
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pswdController = TextEditingController();

  FocusNode mobileFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode pswdFocus = FocusNode();

  String emailError = '';
  String mobileError = '';
  String pswdError = '';

  init() {
    try {
      info = Get.find();
    } catch (Exception) {}
  }

  Future<bool> onBack() async {
    Get.back();
    return true;
  }

  Future<void> onSubmit() async {
    print("onSubmit");
    if (isValid()) {
      Global.show();
      signIn(email: emailController.text, password: pswdController.text)
          .then((value) async {
        Global.dismissLoader();
        Get.back();
        if (value != null) {
          Get.offAll(Home());
        }
      });
    } else {
      notifyListeners();
    }
    print("Login Clicked");
  }

  Future<UserCredential?> signIn(
      {required String email, required String password}) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.message!.contains("no user record")) {
        Global().snackBarWidget("Register yourself");
      } else
        Global().snackBarWidget('${e.message}');
      return null;
    }
  }

  onSignUp() {
    Get.off(() => const SignUp());
  }

  bool isValid() {
    int count = 0;
    if (emailController.text == '') {
      count++;
      emailFocus.requestFocus();
      emailError = "${AppResources.hintInvalid} ${AppResources.email}";
    } else if (emailController.text.isNotEmpty) {
      bool isEmailValid = GetUtils.isEmail(emailController.text);
      if (!isEmailValid) {
        count++;
        Global().snackBarWidget(
            "${AppResources.hintInvalid} ${AppResources.email}");
      }
    } else if (pswdController.text == '') {
      count++;
      pswdError = "${AppResources.hintInvalid} ${AppResources.password}";
    }
    return count == 0 ? true : false;
  }
}
