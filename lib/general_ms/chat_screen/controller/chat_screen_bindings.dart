import 'package:get/get.dart';
import 'package:wp_clone/general_ms/chat_screen/controller/chat_screen_controller.dart';
import 'package:wp_clone/general_ms/chat_screen/controller/chat_screen_repository.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatScreenController>(() => ChatScreenController());
    Get.lazyPut<ChatScreenRepository>(() => ChatScreenRepository());
  }
}
