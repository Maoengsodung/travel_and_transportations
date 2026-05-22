import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  // Show and hide pass
  final oldPassword = true.obs;
  final newPassword = true.obs;

  // text to form
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var passwordError = ''.obs;

  void obscureOldPassword() {
    oldPassword.value = !oldPassword.value;
  }

  void obscureNewPassword() {
    newPassword.value = !newPassword.value;
  }

  void clearTextFields() {
    oldPasswordController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
    passwordError.value = '';
  }

  bool validatePassword() {
    String password = newPasswordController.text.trim();

    if (password.isEmpty) {
      passwordError.value = 'Password is required';
      return false;
    }

    if (password.length < 8) {
      passwordError.value = 'Password must be at least 8 characters';
      return false;
    }

    RegExp regex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{8,}$');
    if (!regex.hasMatch(password)) {
      passwordError.value = 'Must contain uppercase, lowercase and number';
      return false;
    }

    if (password != confirmPasswordController.text.trim()) {
      passwordError.value = 'Password does not match';
      return false;
    }

    passwordError.value = '';
    return true;
  }

  @override
  void onClose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
