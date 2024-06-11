import 'package:get/get.dart';
import 'package:wp_clone/service/api/api_service.dart';

class PhoneAuthRepository {
  final _apiService = Get.find<ApiService>();
  sendVerifyCode(String phoneNumber) async {
    final res = await _apiService.request("/auth/send-code", HttpMethod.POST, {
      "phoneNumber": "90$phoneNumber",
    });
    if (res.statusCode > 200 && res.statusCode < 300) {
      return true;
    } else {
      return false;
    }
  }
}
