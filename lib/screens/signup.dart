import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:satyam_assignment/screens/signup_model.dart';
import 'package:stacked/stacked.dart';

import '../app_resources.dart';
import '../color_res.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupModel>.reactive(
        onViewModelReady: (model) {
          model.init();
        },
        viewModelBuilder: () => SignupModel(),
        builder: (context, model, child) {
          return Scaffold(
            body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: GestureDetector(
                child: Stack(
                  children: <Widget>[
                    Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              Color(0x665ac18e),
                              Color(0x995ac18e),
                              Color(0xcc5ac18e),
                              ColorRes.green,
                            ])),
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 120),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                AppResources.signup,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              buildEmail(model),
                              SizedBox(
                                height: 20,
                              ),
                              buildPass(model),
                              SizedBox(
                                height: 20,
                              ),
                              buildRePass(model),
                              SizedBox(
                                height: 20,
                              ),
                              buildSignupBtn(model),
                              SizedBox(
                                height: 20,
                              ),
                              buildLoginLabel(model),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget buildEmail(SignupModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          AppResources.email,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ],
          ),
          height: 60,
          child: TextField(
            focusNode: model.emailFocus,
            controller: model.emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xffFCC201),
                ),
                hintText: model.emailError == ""
                    ? '${AppResources.hintEnter} ${AppResources.email}'
                    : model.emailError,
                hintStyle: TextStyle(
                  color: model.emailError == ""
                      ? Colors.black38
                      : Colors.redAccent,
                )),
          ),
        )
      ],
    );
  }

  Widget buildLoginLabel(SignupModel model) {
    return GestureDetector(
      onTap: model.onSignIn,
      child: RichText(
        text: TextSpan(
            // text:AppResources.dontHaveAc,
            children: [
              TextSpan(
                  text: AppResources.haveAc,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              TextSpan(
                  text: AppResources.signin,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ],
            style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }

  Widget buildPass(SignupModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          AppResources.password,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ],
          ),
          height: 60,
          child: TextField(
            focusNode: model.pswdFocus,
            controller: model.pswdController,
            keyboardType: TextInputType.visiblePassword,
            style: TextStyle(color: Colors.black87),
            obscureText: model.hidepass,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Color(0xffFCC201),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    model.hidepass ? Icons.visibility : Icons.visibility_off,
                    color: Color(0xffFCC201),
                  ),
                  onPressed: () {
                    model.hidepass = !(model.hidepass);
                    model.notifyListeners();
                  },
                ),
                hintText: model.pswdError == ""
                    ? '${AppResources.hintEnter} ${AppResources.password} '
                    : model.pswdError,
                hintStyle: TextStyle(
                  color:
                      model.pswdError == "" ? Colors.black38 : Colors.redAccent,
                )),
          ),
        )
      ],
    );
  }

  Widget buildRePass(SignupModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          AppResources.rePassword,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ],
          ),
          height: 60,
          child: TextField(
            focusNode: model.confirmPwdFocus,
            controller: model.confirmPwdController,
            keyboardType: TextInputType.visiblePassword,
            style: TextStyle(color: Colors.black87),
            obscureText: model.hidepass,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Color(0xffFCC201),
                ),
                hintText: model.confirmPwdError == ""
                    ? '${AppResources.hintEnter} ${AppResources.password} '
                    : model.confirmPwdError,
                hintStyle: TextStyle(
                  color: model.confirmPwdError == ""
                      ? Colors.black38
                      : Colors.redAccent,
                )),
          ),
        )
      ],
    );
  }

  Widget buildSignupBtn(SignupModel model) {
    return Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
          ],
        ),
        child: InkWell(
            onTap: model.onSignUp,
            child: Center(
              child: Text(
                'Register',
                style: TextStyle(
                  color: ColorRes.green,
                  // color: Color(0xff5ac18e),
                  fontSize: 16.0,
                ),
              ),
            )));
  }
}
