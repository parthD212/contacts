// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';

class ContactController extends GetxController{

  RxBool a = true.obs;
  RxBool b = false.obs;
  Rx<TextEditingController> searchController = TextEditingController().obs;
  RxList<Contact> contacts = <Contact>[].obs;
  RxList<Contact> searchcontacts = <Contact>[].obs;
  //List<Contact> newDataList = List.from();
  //List<String> newDataList = [];

  @override
  void onInit() {
    super.onInit();
    getContact();
    // searchcontacts = searchcontacts!
    //     .where((element) => element.toString().toLowerCase()
    //     .contains(contacts.toString().toLowerCase())).toList();


  }

  void getContact() async {
    if (await FlutterContacts.requestPermission()) {
      contacts.value = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      print(contacts);
         //setState(() {});
    }
  }





  void errorHandler(e) {}

}