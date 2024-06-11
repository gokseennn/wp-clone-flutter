import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wp_clone/general_ms/general_routes.dart';
import 'package:wp_clone/general_ms/welcome_screen/view/welcome_screen.dart';
import 'package:wp_clone/service/api/api_service.dart';

import 'theme.dart';

void main() {
  Get.put(ApiService(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: lightTheme,
        getPages: GeneralRoutes.routes,
        home: const WelcomeScreen());
  }
}
