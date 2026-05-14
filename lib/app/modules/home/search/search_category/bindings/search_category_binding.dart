import 'package:get/get.dart';

import '../controllers/search_category_controller.dart';

class SearchCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchCategoryController>(
      () => SearchCategoryController(),
    );
  }
}
