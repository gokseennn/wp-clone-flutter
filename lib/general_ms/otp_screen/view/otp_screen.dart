import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wp_clone/general_ms/welcome_screen/view/components/primary_button.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});
  static const String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter the OTP Code"),
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
                      child: TextFormField(
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
                    const SizedBox(width: 10),
                  }
                ],
              ),
              const Spacer(),
              PrimaryButton(
                title: "Verify",
                onPressed: () {
                  // Verify the OTP code
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
