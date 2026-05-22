import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../../constant/constant.dart';
import '../../../account_setting/otp/controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 65,
      textStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor),
      ),
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          title: Text(
            'OTP Confirm',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          flexibleSpace: Container(
            color: gradientBottomColor,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Align(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 60),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: borderColor, width: 1),
                            color: Colors.white,
                          ),
                          child: Image.asset('assets/icons/back-outline.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'We just sent an SMS',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  'Use this OTP to complete your registration process. The code is valid for 10 minutes.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: greyColor, height: 1.5),
                ),
              ),
              const SizedBox(height: 15),

              const Text(
                '(+855) 123 456 789',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 35),

              // OTP Input
              _otpConfirm(
                controller: controller,
                defaultPinTheme: defaultPinTheme,
              ),
              const SizedBox(height: 40),

              // Verify Button
              _confirmButton(controller: controller),

              const SizedBox(height: 15),
              Text(
                "Didn't receive code?",
                style: TextStyle(color: greyColor, fontSize: 14),
              ),

              const SizedBox(height: 5),
              _resendOtp(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}

class _resendOtp extends StatelessWidget {
  const _resendOtp({super.key, required this.controller});

  final OtpController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: controller.seconds.value == 0 ? controller.resendOtp : null,
        child: Text(
          controller.seconds.value == 0
              ? 'Resend'
              : 'Resend in ${controller.seconds.value}s',
          style: TextStyle(
            color: controller.seconds.value == 0 ? gradientRight : greyColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class _confirmButton extends StatelessWidget {
  const _confirmButton({super.key, required this.controller});

  final OtpController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: double.infinity,
        child: TextButton(
          onPressed: controller.isLoading.value ? null : controller.verifyOtp,
          style: TextButton.styleFrom(
            backgroundColor: controller.isLoading.value
                ? gradientLeft
                : gradientRight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          child: controller.isLoading.value
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.white,
                  ),
                )
              : const Text(
                  'Verify',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}

class _otpConfirm extends StatelessWidget {
  const _otpConfirm({
    super.key,
    required this.controller,
    required this.defaultPinTheme,
  });

  final OtpController controller;
  final PinTheme defaultPinTheme;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: controller.otpController,
      length: 6,
      autofocus: true,
      showCursor: true,
      keyboardType: TextInputType.number,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: defaultPinTheme.copyDecorationWith(
        border: Border.all(color: gradientRight, width: 2),
      ),
      submittedPinTheme: defaultPinTheme.copyDecorationWith(color: otpColor),
      preFilledWidget: Text(
        '-',
        style: TextStyle(
          fontSize: 22,
          color: greyColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
