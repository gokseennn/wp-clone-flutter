import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:wp_clone/general_ms/general_routes.dart';
import 'package:wp_clone/general_ms/welcome_screen/view/welcome_screen.dart';

import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: lightTheme,
        getPages: GeneralRoutes.routes,
        home: const WelcomeScreen());
  }
}
