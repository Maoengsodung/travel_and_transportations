import 'package:get/get.dart';

class FavoriteController extends GetxController {
  final favorites = <Map<String, dynamic>>[].obs;

  bool isFavorite(Map<String, dynamic> item) {
    return favorites.any((e) => e['id'] == item['id']);
  }

  void toggleFavorite(Map<String, dynamic> item) {
    if (isFavorite(item)) {
      favorites.removeWhere((e) => e['id'] == item['id']);
    } else {
      favorites.add(item);
    }
  }
}
