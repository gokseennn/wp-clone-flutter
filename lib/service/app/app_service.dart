import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wp_clone/service/app/model/user.dart';

class AppService extends GetxService {
  final _user = Rx<User?>(null);
  User? get user => _user.value;

  Future<void> init() async {
    await _initUser();
  }

  Future<void> _initUser() async {
    var isUser = await getUser();
    if (isUser != null) {
      _user.value = user;
    }
  }

  bool isLoggedIn() {
    if (user != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> saveUser(User user) async {
    _user.value = user;
    await saveLogin();
  }

  Future<void> saveLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', _user.value!.toJson().toString());
  }

  void clearLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
  }

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user');
  }
// Kullanıcı login durumunu kontrol etmek için
  // Future<bool> isLoggedIn() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getS('user') ?? false;
  // }
}
