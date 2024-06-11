import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wp_clone/general_ms/otp_screen/view/otp_screen.dart';
import 'package:wp_clone/service/api/api_service.dart';

class PhoneAuthController extends GetxController {
  final _apiService = Get.find<ApiService>();
  final TextEditingController phoneController = TextEditingController();
  void sendVerificationCode() async {
    final res = await _apiService
        .request("http://localhost:3000/auth/send-code", HttpMethod.POST, {
      "phoneNumber": "90${phoneController.text}",
    });
    if (res.statusCode > 200 && res.statusCode < 300) {
      Get.toNamed(OtpScreen.routeName);
    } else {
      print("Hata var");
    }
  }
}
