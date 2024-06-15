import 'package:get/get.dart';
import 'package:wp_clone/service/api/api_service.dart';

class OtpRepository {
  final _apiService = Get.find<ApiService>();
  Future<bool> verifyOtpCode(String otpCode) async {
    final res = await _apiService
        .request("/auth/verify-code", HttpMethod.POST, {"code": otpCode});
    if (res.statusCode > 200 && res.statusCode < 300) {
      return true;
    } else {
      return false;
    }
  }

  resendSms() async {
    final res = await _apiService.request(
      "/auth/resend-code",
      HttpMethod.POST,
    );
    if (res.statusCode > 200 && res.statusCode < 300) {
      return true;
    } else {
      return false;
    }
  }
}
