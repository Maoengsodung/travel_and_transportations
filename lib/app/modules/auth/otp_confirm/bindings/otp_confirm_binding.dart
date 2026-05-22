import 'package:get/get.dart';

import '../controllers/otp_confirm_controller.dart';

class OtpConfirmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpConfirmController>(
      () => OtpConfirmController(),
    );
  }
}
