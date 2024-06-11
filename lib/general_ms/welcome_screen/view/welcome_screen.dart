import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:wp_clone/general_ms/phone_auth_screen/view/phone_auth_screen.dart';
import 'package:wp_clone/theme.dart';
import 'package:wp_clone/general_ms/welcome_screen/view/components/primary_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static const String routeName = '/welcome_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Welcome to WhatsUp",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: kLightBgColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                const SizedBox(height: 60),
                Image.asset(
                  "assets/img/welcome_bg.png",
                  width: 240,
                  height: 240,
                  color: kPrimaryColor,
                ),
                const SizedBox(height: 50),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: "Read our "),
                      TextSpan(
                        text: "Privacy Policy. ",
                        style: TextStyle(color: kTextHighlightColor),
                      ),
                      TextSpan(
                          text: "Tap \"Agree and continue\" to accept the "),
                      TextSpan(
                        text: "Terms of Service.",
                        style: TextStyle(color: kTextHighlightColor),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: 320,
                  child: PrimaryButton(
                    title: "AGREE AND CONTINUE",
                    onPressed: () => Get.toNamed(PhoneAuthScreen.routeName),
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
