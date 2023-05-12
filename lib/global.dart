import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Global {
  Duration seconds = Duration(seconds: 2);

  void snackBarWidget(String titleName) {
    ScaffoldMessenger.of(Get.context!)
        .showSnackBar(
          SnackBar(
            content: Text(
              titleName,
              style: const TextStyle(overflow: TextOverflow.ellipsis),
              maxLines: 2,
            ),
            backgroundColor: Colors.black87,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 5,
            duration: seconds,
            behavior: SnackBarBehavior.floating,
          ),
        )
        .closed
        .then((value) => ScaffoldMessenger.of(Get.context!).clearSnackBars());
  }

  Future<void> lottieLoader() {
    return showDialog(
        context: Get.context!,
        builder: (context) {
          return Center(
              child: Lottie.asset(loadingLottie, height: 100, width: 100));
        },
        barrierDismissible: false,
        barrierLabel: '');
  }

  static const String loadingLottie = "assets/loader.json";

  static void show() {
    Get.dialog(
      Center(
        child: Lottie.asset(
          loadingLottie,
          height: 100,
          width: 100,
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void dismissLoader() {
    print("dismissLoader");
    Get.back();
  }
}
