import 'package:get/get.dart';

class SignUpController extends GetxController {
  final obscurePassword = false.obs;

  void toglePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  // Check box
  RxBool isChecked = false.obs;

  void toggleCheckbox(bool? value) {
    isChecked.value = value ?? false;
  }
}
