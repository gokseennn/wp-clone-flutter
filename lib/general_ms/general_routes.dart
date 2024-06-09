import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:wp_clone/general_ms/phone_auth_screen/controller/phone_auth_binding.dart';
import 'package:wp_clone/general_ms/phone_auth_screen/view/phone_auth_screen.dart';
import 'package:wp_clone/general_ms/welcome_screen/view/welcome_screen.dart';

class GeneralRoutes {
  static final routes = [
    GetPage(
      name: WelcomeScreen.routeName,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
        name: PhoneAuthScreen.routeName,
        page: () => const PhoneAuthScreen(),
        binding: PhoneAuthBinding()),
  ];
}
