import 'package:get/get.dart';
import 'package:travel_transportation/app/modules/account/views/account_view.dart';
import 'package:travel_transportation/app/modules/booking/views/booking_view.dart';
import 'package:travel_transportation/app/modules/history/views/history_view.dart';
import 'package:travel_transportation/app/modules/home/views/home_view.dart';

class MainController extends GetxController {
  var selectIndex = 0.obs;

  final screens = [HomeView(), BookingView(), HistoryView(), AccountView()];

  void changeScreen(int index) {
    selectIndex.value = index;
  }
}
