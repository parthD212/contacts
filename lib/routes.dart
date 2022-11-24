import 'package:contacts/screens/screen.dart';
import 'package:contacts/screens/splash/splash_screen.dart';
import 'package:get/get.dart';
import 'binding/binding.dart';


final List<GetPage> appPages = [
  GetPage(
      name: SplashScreen.pageId,
      page: () => SplashScreen(),
      binding: SplashBinding()),

  GetPage(
      name: SecondSplashScreen.pageId,
      page: () => SecondSplashScreen(),
      binding: SecondSplashBinding()),

  GetPage(
      name: ContactScreen.pageId,
      page: () => ContactScreen(),
      binding: ContactBinding()),
];
