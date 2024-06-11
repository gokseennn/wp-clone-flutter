import 'package:get/get.dart';
import 'package:wp_clone/general_ms/otp_screen/controller/otp_controller.dart';
import 'package:wp_clone/general_ms/otp_screen/controller/otp_repository.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpController>(() => OtpController());
    Get.lazyPut<OtpRepository>(() => OtpRepository());
  }
}
