import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';

class LoadingController extends GetxController {
  var isLoading = true.obs;
  var items = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() async {
    await Future.delayed(Duration(seconds: 3));
    Get.offAllNamed(Routes.MAIN);

    isLoading.value = false;
  }
}
