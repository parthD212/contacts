
import 'package:contacts/controller/contact_controller.dart';
import 'package:get/get.dart';

class ContactBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<ContactController>(ContactController(), permanent: false);
  }

}