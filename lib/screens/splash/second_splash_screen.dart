import 'package:contacts/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondSplashScreen extends GetView<SecondSplashController> {
  static const pageId = "/SecondSplash";

  const SecondSplashScreen({super.key});
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
          child: SizedBox(
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/user_logo.png'),
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
      ),
    );
  }
}

