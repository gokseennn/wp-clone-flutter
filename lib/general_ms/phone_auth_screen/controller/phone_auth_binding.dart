import 'package:get/get.dart';
import 'package:wp_clone/general_ms/phone_auth_screen/controller/phone_auth_controller.dart';
import 'package:wp_clone/general_ms/phone_auth_screen/controller/phone_auth_repository.dart';

class PhoneAuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhoneAuthController>(() => PhoneAuthController());
    Get.lazyPut<PhoneAuthRepository>(() => PhoneAuthRepository());
  }
}
