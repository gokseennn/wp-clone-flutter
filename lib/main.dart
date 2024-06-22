import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wp_clone/general_ms/general_routes.dart';
import 'package:wp_clone/general_ms/chat_screen/view/chat_screen.dart';
import 'package:wp_clone/general_ms/welcome_screen/view/welcome_screen.dart';
import 'package:wp_clone/service/api/api_service.dart';
import 'package:wp_clone/service/app/app_service.dart';

import 'theme.dart';

void main() async {
  Get.put(ApiService(), permanent: true);
  final appService = Get.put(
    AppService(),
    permanent: true,
  );
  await appService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appService = Get.find<AppService>();
    return GetMaterialApp(
        theme: lightTheme,
        getPages: GeneralRoutes.routes,
        home: appService.isLoggedIn()
            ? const WelcomeScreen()
            : const ChatScreen());
  }
}
