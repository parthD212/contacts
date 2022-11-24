import 'dart:async';

import 'package:contacts/screens/screen.dart';
import 'package:get/get.dart';

class SecondSplashController extends GetxController{
  void errorHandler(e) {}

  @override
  void onInit() {
    Timer(const Duration(seconds: 5), contact);
    super.onInit();
  }

  void contact() async {
      return Get.offAndToNamed(ContactScreen.pageId);
  }
}

