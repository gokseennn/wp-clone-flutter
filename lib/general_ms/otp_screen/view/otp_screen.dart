import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wp_clone/general_ms/otp_screen/controller/otp_controller.dart';
import 'package:wp_clone/general_ms/welcome_screen/view/components/primary_button.dart';

class OtpScreen extends GetView<OtpController> {
  const OtpScreen({super.key});
  static const String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter SMS Code"),
        centerTitle: true,
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  for (int i = 0; i < 4; i++) ...{
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: TextFormField(
                          controller: controller.otpController[i],
                          keyboardType: TextInputType.number,
                          style: Theme.of(context).textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                          onChanged: (text) {
                            if (text.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                    ),
                  }
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 24.0),
                child: Text(
                  "Enter 4-digit code",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: InkWell(
                  onTap: () => controller.resendSms(),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 12.0),
                        child: Icon(Icons.message,
                            color: Color.fromRGBO(18, 140, 126, 1)),
                      ),
                      Text(
                        "Resend SMS",
                        style:
                            TextStyle(color: Color.fromRGBO(18, 140, 126, 1)),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 18),
                height: 1,
                color: const Color.fromARGB(255, 206, 203, 203),
                width: double.infinity,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 18.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 12.0),
                      child: Icon(Icons.phone,
                          color: Color.fromRGBO(18, 140, 126, 1)),
                    ),
                    Text(
                      "Call Me",
                      style: TextStyle(color: Color.fromRGBO(18, 140, 126, 1)),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom + 20),
                child: PrimaryButton(
                    title: "Verify", onPressed: controller.verifyCode),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
