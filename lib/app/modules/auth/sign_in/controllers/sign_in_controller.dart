import 'package:get/get.dart';

class SignInController extends GetxController {
  final obscurePassword = true.obs;

  void toglePassword() {
    obscurePassword.value = !obscurePassword.value;
  }
}
