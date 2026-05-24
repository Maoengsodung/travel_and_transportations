import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final obscurePassword = true.obs;
  final newPassController = TextEditingController();
  var passwordError = ''.obs;
  final isLoading = false.obs;

  void toglePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  // Check box
  RxBool isChecked = false.obs;

  void toggleCheckbox(bool? value) {
    isChecked.value = value ?? false;
  }

  // strong Password
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
