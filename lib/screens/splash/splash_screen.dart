import 'package:contacts/controller/controller.dart';
import 'package:contacts/screens/screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  static const pageId = "/Splash";

  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill,
            repeat: ImageRepeat.noRepeat,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/user_logo.png',
              ),
              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  "Contact Organizer",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),

        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill,
            repeat: ImageRepeat.noRepeat,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(45),
          child: MaterialButton(
            color: Colors.white,
            height: 50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child:  const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Text("Sync Contacts",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,

                  )),
            ),
            onPressed: () {
              Get.toNamed(SecondSplashScreen.pageId);
            },
          ),
        ),
      ),
    );
  }
}

