// import 'dart:io';
// import 'package:border_traffic_flutter/api/apis.dart';
// import 'package:border_traffic_flutter/model/loginResonse.dart';
// import 'package:border_traffic_flutter/util/util.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
//
// class Common {
//   static bool get isAndroid => Platform.isAndroid;
//
//   static bool get isIOS => Platform.isIOS;
//
//   static bool isNull(dynamic item) => item == null;
//
//   static void getSnackBar(String title, String description,
//       {int duration = 2, SnackPosition position = SnackPosition.BOTTOM}) {
//     Get.snackbar(title, description,
//         snackPosition: position, duration: Duration(seconds: duration));
//   }
//
//   static const String strLoginRes = 'login_response';
//
//   static String userId = '';
//   static String language = 'es';
//   static String deviceId = '';
//   static String deviceName = '';
//   static String tokenKey = '';
//   static bool isActiveSup = true;
//
//   static Future<bool> checkInternetConnection() async {
//     var connectivityResult = await Connectivity().checkConnectivity();
//     if (connectivityResult == ConnectivityResult.none) {
//       await Fluttertoast.showToast(msg: 'No Internet Connection is available.');
//       return false;
//     }
//     return true;
//   }
//
//   static convertToDate(String date) {
//     // DateTime tempDate = DateFormat("yyyy-MM-ddThh:mm:ss").parse(date);
//     DateTime tempDate = DateFormat("MM/dd/yyyy hh:mm:ss a").parse(date);
//     String formatDate = DateFormat('MM-dd-yyyy').format(tempDate);
//     return formatDate;
//   }
//
//   static convertToSecond(String date) {
//     // DateTime tempDate = DateFormat("yyyy-MM-ddThh:mm:ss").parse(date);
//     DateTime tempDate = DateFormat("MM/dd/yyyy hh:mm:ss a").parse(date);
//     String formatDate = DateFormat('hh:mm a').format(tempDate);
//     return formatDate;
//   }
//
//   static timeConvertToAm(String date) {
//     // DateTime tempDate = DateFormat("yyyy-MM-ddThh:mm:ss").parse(date);
//     DateTime tempDate = DateFormat("hh:mm:ss").parse(date);
//     String formatDate = DateFormat('hh:mm a').format(tempDate);
//     return formatDate;
//   }
//
//   static waitTime(String firstDate, String secondDate) {
//     // DateTime tempDate = DateFormat("yyyy-MM-ddThh:mm:ss").parse(date);
//     DateTime tempDate1 = DateFormat("MM/dd/yyyy hh:mm:ss a").parse(firstDate);
//     DateTime tempDate2 = DateFormat("MM/dd/yyyy hh:mm:ss a").parse(secondDate);
//     String time = DateFormat('HH:mm:ss').format(DateFormat('HH:mm:ss').parse(
//         '${tempDate2.difference(tempDate1).inHours}:${tempDate2.difference(tempDate1).inMinutes}:${tempDate2.difference(tempDate1).inSeconds}'));
//     return time;
//   }
//   static saveLoginData(String json, LoginResponse response) {
//     sharedPreferencesHelper.storeBoolPrefData(Const.strIsLogin, true);
//     sharedPreferencesHelper.storePrefData(Const.strLoginRes, json);
//     sharedPreferencesHelper.storePrefData(Const.strEmail, response.email!);
//     sharedPreferencesHelper.storeBoolPrefData(Const.strIsPaid, response.isPaid!);
//     Const.isPaid = response.isPaid!;
//   }
// }
