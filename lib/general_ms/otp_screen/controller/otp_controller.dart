import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wp_clone/general_ms/home_screen/home_screen.dart';
import 'package:wp_clone/general_ms/otp_screen/controller/otp_repository.dart';

class OtpController extends GetxController {
  final _repository = Get.find<OtpRepository>();
  final otpController = List.generate(4, (index) => TextEditingController());
  void verifyCode() {
    _repository.verifyOtpCode(otpCode).then((value) {
      if (value) {
        Get.snackbar("Success", "OTP code is correct");
        Get.toNamed(HomeScreen.routeName);
      } else {
        Get.snackbar("Error", "OTP code is incorrect");
      }
    });
  }

  void resendSms() {
    _repository.resendSms();
  }

  String get otpCode {
    return otpController.map((e) => e.text).join();
  }
}
