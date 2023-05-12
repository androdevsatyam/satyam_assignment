import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:satyam_assignment/screens/welcome.dart';
import 'package:stacked/stacked.dart';

import '../app_resources.dart';
import '../global.dart';
import '../models/pref_service.dart';
import '../models/user_data.dart';
import 'home.dart';
import 'login.dart';

class SignupModel extends BaseViewModel {
  late UserData info;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pswdController = TextEditingController();
  TextEditingController confirmPwdController = TextEditingController();

  FocusNode mobileFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode pswdFocus = FocusNode();
  FocusNode confirmPwdFocus = FocusNode();

  String emailError = '';
  String mobileError = '';
  String pswdError = '';
  String confirmPwdError = '';

  bool hidepass = true;

  init() {}

  Future<void> onSignUp() async {
    if (isValid()) {
      Global.show();

      signUp(email: emailController.text, password: pswdController.text)
          .then((value) async {
        Global().snackBarWidget(AppResources.registrationDone);
        await PrefService.setLoginText(true);
        Global.dismissLoader();
        Get.offAll(() => const Home());
      });
    }
    notifyListeners();
  }

  onSignIn() {
    Get.off(() => const Login());
  }

  Future<UserCredential?> signUp(
      {required String email, required String password}) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Global().snackBarWidget('${e.message}');
      Get.offAll(() => const Welcome());
      return null;
    }
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
    } else if (confirmPwdController.text == '') {
      count++;
      confirmPwdError = "${AppResources.hintInvalid} ${AppResources.password}";
    } else {
      if (confirmPwdController.text != pswdController.text) {
        count++;
        confirmPwdController.clear();
        confirmPwdError = AppResources.passwordMismatch;
      }
      confirmPwdFocus.unfocus();
    }
    return count == 0 ? true : false;
  }
}
