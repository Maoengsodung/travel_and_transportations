import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';

class OtpConfirmController extends GetxController {
  final otpController = TextEditingController();

  RxInt seconds = 60.obs;
  RxBool isLoading = false.obs;

  Timer? timer;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void startTimer() {
    seconds.value = 60;

    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds.value > 0) {
        seconds.value--;
      } else {
        timer.cancel();
      }
    });
  }

  void verifyOtp() async {
    if (otpController.text.length != 6) {
      Get.snackbar('Error', 'Please enter 6 digit OTP');
      return;
    }
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    Get.toNamed(Routes.NEW_PASSWORD);
    Get.snackbar('Success', 'OTP Verified Successfully');
  }

  void resendOtp() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.snackbar('OTP Resend', 'This your OTO resend 123456');
    startTimer();
  }

  @override
  void onClose() {
    otpController.dispose();
    timer?.cancel();
    super.onClose();
  }
}
