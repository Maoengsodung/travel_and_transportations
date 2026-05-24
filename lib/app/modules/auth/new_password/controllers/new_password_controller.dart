import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPasswordController extends GetxController {
  final newPassword = true.obs;
  final confirmPassword = true.obs;
  final isLoading = false.obs;

  // declare value validate
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();
  var passwordError = ''.obs;

  void obscureNewPassword() {
    newPassword.value = !newPassword.value;
  }

  // Validate Password
  bool validatePassword() {
    isLoading(true);
    String password = newPassController.text.trim();

    if (password.isEmpty) {
      passwordError.value = 'Password is required';
      return false;
    }

    if (password.length < 8) {
      passwordError.value = 'Password must be at least 8 characters';
      return false;
    }

    // Strong password example
    RegExp regex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{8,}$');

    if (!regex.hasMatch(password)) {
      passwordError.value = 'Must contain uppercase, lowercase and number';
      return false;
    }
    passwordError.value = '';
    isLoading(false);
    return true;
  }
}
