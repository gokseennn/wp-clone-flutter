import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:wp_clone/general_ms/chat_screen/controller/chat_screen_bindings.dart';
import 'package:wp_clone/general_ms/chat_screen/view/chat_screen.dart';
import 'package:wp_clone/general_ms/otp_screen/controller/otp_binding.dart';
import 'package:wp_clone/general_ms/otp_screen/controller/otp_repository.dart';
import 'package:wp_clone/general_ms/otp_screen/view/otp_screen.dart';
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
      binding: PhoneAuthBinding(),
    ),
    GetPage(
      name: OtpScreen.routeName,
      page: () => const OtpScreen(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: ChatScreen.routeName,
      page: () => const ChatScreen(),
    ),
    GetPage(
      name: ChatScreen.routeName,
      page: () => const ChatScreen(),
      binding: ChatBinding(),
    ),
  ];
}
