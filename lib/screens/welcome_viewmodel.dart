import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import '../models/pref_service.dart';

class WelcomeViewModel extends BaseViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool loggedIn = false;

  init() {
    PrefService.getLoginText().then((value) {
      if (value != null) loggedIn = true;
    });
  }

  Future<bool> onBack() async {
    return true;
  }
}
