import 'package:get/get.dart';

import '../../../../../constant/constant.dart';

class SearchCategoryController extends GetxController {
  // Filtered List
  var filteredBooking = <Map<String, dynamic>>[].obs;
  var searchText = ''.obs;

  // History
  var searchHistory = <String>[].obs;
  // Search Function
  void searchBooking(String value) {
    searchText.value = value;
    if (value.trim().isEmpty) {
      filteredBooking.clear();
      return;
    }
    // Save history
    if (!searchHistory.contains(value)) {
      searchHistory.insert(0, value);
    }
    filteredBooking.assignAll(
      booking.where((item) {
        final name = item['name'].toString().toLowerCase();

        final station = item['station'].toString().toLowerCase();

        final direction = item['direction'].toString().toLowerCase();

        return name.contains(value.toLowerCase()) ||
            station.contains(value.toLowerCase()) ||
            direction.contains(value.toLowerCase());
      }).toList(),
    );
  }

  // Remove history
  void removeHistory(String value) {
    searchHistory.remove(value);
  }

  // Clear all history
  void clearHistory() {
    searchHistory.clear();
  }
}
