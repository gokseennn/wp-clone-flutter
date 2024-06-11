import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wp_clone/general_ms/otp_screen/view/otp_screen.dart';
import 'package:wp_clone/general_ms/phone_auth_screen/controller/phone_auth_repository.dart';

class PhoneAuthController extends GetxController {
  final _repository = Get.find<PhoneAuthRepository>();
  final TextEditingController phoneController = TextEditingController();
  void sendVerificationCode() async {
    final res = await _repository.sendVerifyCode(phoneController.text);
    if (res) {
      Get.toNamed(OtpScreen.routeName);
    } else {
      Get.snackbar("Error", "Something went wrong");
    }
  }
}
