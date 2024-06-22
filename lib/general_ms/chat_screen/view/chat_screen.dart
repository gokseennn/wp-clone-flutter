import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wp_clone/common/common_screen.dart';
import 'package:wp_clone/general_ms/chat_screen/controller/chat_screen_controller.dart';
import 'package:wp_clone/theme.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  static const String routeName = "/chat";
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatScreenController>(
        init: ChatScreenController(),
        builder: (controller) {
          return CommonScreen(
            title: "Sohbetler",
            body: SafeArea(
              child: Column(
                children: [
                  ListTile(
                    title: const Text(
                      "name",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: const Text("lastMessage"),
                    leading: CircleAvatar(
                      radius: 24,
                      backgroundImage: const NetworkImage("avatarImage"),
                      backgroundColor: Colors.grey.withOpacity(0.2),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),
                        const Text(
                            style: TextStyle(
                                color: 1 > 0 ? kPrimaryColor : Colors.grey,
                                fontSize: 13),
                            "Salı"),
                        // if (unreadMessages > 0) ...{
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.all(1),
                          decoration: const BoxDecoration(
                            color: kPrimaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 2.0),
                            child: Text(
                              "1",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                        //     },
                        const Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
