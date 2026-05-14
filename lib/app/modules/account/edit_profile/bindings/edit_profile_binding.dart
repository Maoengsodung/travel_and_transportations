import 'package:get/get.dart';

import '../controllers/edit_profile_controller.dart';

class InfoProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(() => EditProfileController());
  }
}
