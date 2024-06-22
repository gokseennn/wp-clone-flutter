import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wp_clone/general_ms/chat_screen/view/chat_screen.dart';
import 'package:wp_clone/general_ms/otp_screen/controller/otp_repository.dart';
import 'package:wp_clone/service/app/app_service.dart';
import 'package:wp_clone/service/app/model/user.dart';

class OtpController extends GetxController {
  final _appService = Get.find<AppService>();
  final _repository = Get.find<OtpRepository>();
  final otpController = List.generate(4, (index) => TextEditingController());
  void verifyCode() async {
    _repository.verifyOtpCode(otpCode).then((value) async {
      if (value) {
        await _appService.saveUser(User(phoneNumber: Get.arguments.toString()));
        Get.snackbar("Success", "OTP code is correct");
        Get.toNamed(ChatScreen.routeName);
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
