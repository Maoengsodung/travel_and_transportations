import 'package:get/get.dart';

class SearchController extends GetxController {
  var isSelected = false.obs;

  void saveFavorite(bool select) {
    isSelected.value = select;
  }
}
