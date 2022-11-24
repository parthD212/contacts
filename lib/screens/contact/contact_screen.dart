import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import '../../controller/controller.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends GetView<ContactController> {
  static const pageId = "/Contact";

  const ContactScreen({Key? key}) : super(key: key);

  // Future<List<Contact>> contacts =  FlutterContacts.getContacts(
  // withProperties: true, withPhoto: true);
   // in leading icon show first letter of first and last name


  //List<Contact>? contacts;

  // @override
  //
  // void onInit() {
  //   //super.onInit();
  //  getContact();
  // }
  //
  // void getContact() async {
  //   if (await FlutterContacts.requestPermission()) {
  //     contacts = await FlutterContacts.getContacts(
  //         withProperties: true, withPhoto: true);
  //     print(contacts);
  //  //   setState(() {});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Contact Organizer",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 23),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert_rounded,
                  size: 35,
                  color: Colors.black,
                ))
          ],
        ),
        body: Container(
          color: Colors.white,
          child:  Obx(()=>
             Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 22),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.a.value = true;
                            if (controller.a.value == false) {
                              controller.b.value = true;
                            }
                            if (controller.a.value == true) {
                              controller.b.value = false;
                            }
                          },
                          child: Container(
                            height: Get.height * 0.05,
                            width: Get.width * 0.35,
                            decoration: BoxDecoration(
                                color: controller.a.value
                                    ? Colors.blue
                                    : const Color.fromARGB(60, 25, 120, 225),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Text(
                              "Google (${0})",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: controller.a.value
                                      ? Colors.white
                                      : Colors.black),
                            )),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        InkWell(
                          onTap: () {
                            controller.b.value = true;
                            if (controller.b.value == false) {
                              controller.a.value = true;
                            }
                            if (controller.b.value == true) {
                              controller.a.value = false;
                            }
                          },
                          child: Container(
                            height: Get.height * 0.05,
                            width: Get.width * 0.45,
                            decoration: BoxDecoration(
                                color: controller.b.value
                                    ? Colors.blue
                                    : const Color.fromARGB(60, 25, 120, 225),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.white30,
                                    blurRadius: 1,
                                    spreadRadius: 2,
                                    offset: Offset(1, 1),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                  "All Contacts (${controller.contacts.length})",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: controller.b.value
                                          ? Colors.white
                                          : Colors.black)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    width: Get.height * 0.46,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(150, 190, 190, 190),
                    ),
                    child: Obx(()=>
                       TextFormField(
                        onChanged: (value){
                          controller.searchcontacts.value = controller.contacts
                              .where((element) => element.toString().toLowerCase()
                              .contains(value.toString().toLowerCase())).toList();

                        },
                        controller: controller.searchController.value,
                        decoration: const InputDecoration(
                            prefixIcon:
                                Icon(Icons.search, size: 25, color: Colors.grey),
                            hintText: "Search",
                            focusColor: Colors.white,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey)),
                        autofocus: false,
                        enableInteractiveSelection: false,
                      ),
                    ),
                  ),
                  controller.a.value == true
                      ?

                      /// google contact
                      const Center(

                        child: Text("No contact found"),
                        )


                      /// /all contact
                      : (controller.contacts) == null
                          ? const Center(child: CircularProgressIndicator())
                          :


                    Expanded(
                                child: ListView.builder(
                                  //itemCount: controller.contacts!.length,
                                  itemCount: controller.searchController.toString().isNotEmpty?controller.searchcontacts.length : controller.contacts.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    Uint8List? image =
                                        controller.contacts[index].photo;
                                    String num = (controller
                                            .contacts[index].phones.isNotEmpty)
                                        ? (controller
                                            .contacts[index].phones.first.number)
                                        : "--";
                                    String email = (controller
                                        .contacts[index].emails.isNotEmpty)
                                        ? (controller
                                        .contacts[index].emails.first.address)
                                        : "--";
                                    return controller.searchcontacts.toString().isNotEmpty
                                        ?
                                    ListTile(
                                        leading:
                                        (controller.searchcontacts[index].photo ==
                                            null)
                                            ? const CircleAvatar(
                                            child: Icon(Icons.person))
                                            : CircleAvatar(
                                            backgroundImage:
                                            MemoryImage(image!)),
                                        title: Text(
                                            "${controller.searchcontacts[index].name.first} ${controller.searchcontacts[index].name.last}"),
                                        subtitle: Text(num),
                                        onTap: () {
                                          if (controller
                                              .searchcontacts[index].phones.isNotEmpty) {

                                            showModalBottomSheet(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(30.0),
                                                ),
                                                backgroundColor: Colors.white,
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return Container(
                                                    height: 350,
                                                    decoration:  const BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                          Radius.circular(
                                                              50),
                                                          topLeft:
                                                          Radius.circular(
                                                              50)),
                                                      color: Colors.white,
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          const EdgeInsets.only(
                                                              right: 20,
                                                              top: 20),
                                                          child: IconButton(
                                                              onPressed: () {
                                                                Get.back();
                                                              },
                                                              icon:  const Icon(
                                                                  Icons.close,
                                                                  size: 35)),
                                                        ),
                                                        (controller.searchcontacts[index]
                                                            .photo == null)
                                                            ?  const Center( child:  CircleAvatar(
                                                          radius: 50,
                                                          child: Icon(
                                                            Icons.person,
                                                            size: 50,
                                                          ),
                                                        ),
                                                        )
                                                            : Center(
                                                          child: CircleAvatar(
                                                            backgroundImage:
                                                            MemoryImage(
                                                                image!),
                                                            radius: 50,
                                                          ),
                                                        ),
                                                        const SizedBox(height: 10,),
                                                        Center(
                                                          child: Text(
                                                            "${controller.searchcontacts[index].name.first}"
                                                                " ${controller.searchcontacts[index].name.last}",
                                                            style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
                                                        ),


                                                        const Divider(indent: 20,endIndent: 20,),
                                                        Padding(
                                                          padding:  const EdgeInsets.only(left: 15, right: 15),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text(num),
                                                              Row(
                                                                children: [
                                                                  Container(

                                                                    decoration: const BoxDecoration(
                                                                      shape: BoxShape.circle,
                                                                      color:Color.fromARGB(60, 25, 120, 225),
                                                                    ),
                                                                    child: IconButton(
                                                                        onPressed: () {
                                                                          //launch('tel: $num');
                                                                          FlutterPhoneDirectCaller.callNumber('tel: $num');
                                                                        },
                                                                        icon: const Icon(
                                                                          Icons.call,color: Colors.blue,)),
                                                                  ),
                                                                  const SizedBox(width: 15,),
                                                                  Container(
                                                                    decoration: const BoxDecoration(
                                                                      shape: BoxShape.circle,
                                                                      color:Color.fromARGB(60, 25, 120, 225),
                                                                    ),
                                                                    child: IconButton(
                                                                        onPressed: () {
                                                                          //sending_SMS('Hello, this the test message', ["6355439872"]);
                                                                          //launchSms('sms:$nu);
                                                                          launch('sms:$num?body=hii');
                                                                        },
                                                                        icon:  const Icon(
                                                                          Icons.message, color: Colors.blue,)),
                                                                  )
                                                                ],
                                                              ),

                                                            ],
                                                          ),
                                                        ),
                                                        const Divider(indent: 20,endIndent: 20,),
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 15,),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "$email ", ),
                                                            ],
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  );
                                                });
                                            //launch('tel: $num');
                                          }
                                        }):
                                    // Container(color: Colors.red,height: 333,
                                    //   child: Text(controller.searchcontacts[index].displayName),):









                                      ListTile(
                                        leading:
                                            (controller.contacts[index].photo ==
                                                    null)
                                                ? const CircleAvatar(
                                                    child: Icon(Icons.person))
                                                : CircleAvatar(
                                                    backgroundImage:
                                                        MemoryImage(image!)),
                                        title: Text(
                                            "${controller.contacts[index].name.first} ${controller.contacts[index].name.last}"),
                                        subtitle: Text(num),
                                        onTap: () {
                                          if (controller
                                              .contacts[index].phones.isNotEmpty) {

                                            showModalBottomSheet(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30.0),
                                                ),
                                                backgroundColor: Colors.white,
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return Container(
                                                    height: 350,
                                                    decoration:  const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight:
                                                                  Radius.circular(
                                                                      50),
                                                              topLeft:
                                                                  Radius.circular(
                                                                      50)),
                                                      color: Colors.white,
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.end,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                               const EdgeInsets.only(
                                                                  right: 20,
                                                                  top: 20),
                                                          child: IconButton(
                                                              onPressed: () {
                                                                Get.back();
                                                              },
                                                              icon:  const Icon(
                                                                  Icons.close,
                                                                  size: 35)),
                                                        ),
                                                        (controller.contacts[index]
                                                                    .photo == null)
                                                            ?  const Center( child:  CircleAvatar(
                                                                  radius: 50,
                                                                  child: Icon(
                                                                    Icons.person,
                                                                    size: 50,
                                                                  ),
                                                                ),
                                                            )
                                                            : Center(
                                                              child: CircleAvatar(
                                                                  backgroundImage:
                                                                      MemoryImage(
                                                                          image!),
                                                                  radius: 50,
                                                                ),
                                                            ),
                                                        const SizedBox(height: 10,),
                                                        Center(
                                                          child: Text(
                                                              "${controller.contacts[index].name.first} ${controller.contacts[index].name.last}", style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
                                                        ),


                                                        const Divider(indent: 20,endIndent: 20,),
                                                        Padding(
                                                          padding:  const EdgeInsets.only(left: 15, right: 15),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text(num),
                                                              Row(
                                                                children: [
                                                                  Container(

                                                                    decoration: const BoxDecoration(
                                                                      shape: BoxShape.circle,
                                                                      color:Color.fromARGB(60, 25, 120, 225),
                                                                    ),
                                                                    child: IconButton(
                                                                        onPressed: () {
                                                                          //launch('tel: $num');
                                                                          FlutterPhoneDirectCaller.callNumber('tel: $num');
                                                                        },
                                                                        icon: const Icon(
                                                                            Icons.call,color: Colors.blue,)),
                                                                  ),
                                                                  const SizedBox(width: 15,),
                                                                  Container(
                                                                    decoration: const BoxDecoration(
                                                                      shape: BoxShape.circle,
                                                                      color:Color.fromARGB(60, 25, 120, 225),
                                                                    ),
                                                                    child: IconButton(
                                                                        onPressed: () {
                                                                          //sending_SMS('Hello, this the test message', ["6355439872"]);
                                                                          //launchSms('sms:$nu);
                                                                          launch('sms:$num?body=hii');
                                                                        },
                                                                        icon:  const Icon(
                                                                            Icons.message, color: Colors.blue,)),
                                                                  )
                                                                ],
                                                              ),

                                                            ],
                                                          ),
                                                        ),
                                                        const Divider(indent: 20,endIndent: 20,),
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 15,),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "$email ", ),
                                                            ],
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  );
                                                });
                                            //launch('tel: $num');
                                          }
                                        });
                                  },
                                ),
                              ),


                  ////
                ],
              ),
          ),

        ),
      ),
    );
  }

}
