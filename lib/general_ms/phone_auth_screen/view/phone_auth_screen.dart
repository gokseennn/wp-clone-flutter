import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wp_clone/general_ms/phone_auth_screen/controller/phone_auth_controller.dart';
import 'package:wp_clone/general_ms/welcome_screen/view/components/primary_button.dart';
import 'package:wp_clone/theme.dart';

class PhoneAuthScreen extends GetView<PhoneAuthController> {
  const PhoneAuthScreen({super.key});
  static const String routeName = '/phone_auth_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter your phone number"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: "WhatsApp will need to verify your phone number. "),
                  TextSpan(
                    text: "What's my number?",
                    style: TextStyle(color: kTextHighlightColor),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      //controller: _extController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.phone,

                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: const InputDecoration(
                        hintText: "90",
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    flex: 4,
                    child: TextField(
                      controller: controller.phoneController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.phone,
                      decoration:
                          const InputDecoration(hintText: "Phone Number"),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: PrimaryButton(
                title: "NEXT",
                onPressed: controller.sendVerificationCode,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
