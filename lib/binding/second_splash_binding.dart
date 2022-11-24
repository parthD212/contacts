import 'package:contacts/controller/controller.dart';
import 'package:get/get.dart';

class SecondSplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SecondSplashController>(SecondSplashController(), permanent: false);
  }

}


