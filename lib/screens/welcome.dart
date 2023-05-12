import 'package:flutter/material.dart';
import 'package:satyam_assignment/screens/home.dart';
import 'package:satyam_assignment/screens/welcome_viewmodel.dart';
import 'package:stacked/stacked.dart';

import 'login.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelcomeViewModel>.reactive(
        onViewModelReady: (model) {
          model.init();
        },
        viewModelBuilder: () => WelcomeViewModel(),
        builder: (context, model, child) {
          return WillPopScope(
            onWillPop: model.onBack,
            child: model.loggedIn ? Home() : Login(),
          );
        });
  }
}
