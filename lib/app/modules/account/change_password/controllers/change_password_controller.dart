import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  final securePassword = false.obs;

  void obscurePassword() {
    securePassword.value = !securePassword.value;
  }
}
