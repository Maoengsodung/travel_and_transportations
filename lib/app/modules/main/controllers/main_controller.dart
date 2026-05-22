import 'package:get/get.dart';
import 'package:travel_transportation/app/modules/account_setting/booking/views/booking_view.dart';

import '../../account_setting/account/views/account_view.dart';
import '../../favorite/views/favorite_view.dart';
import '../../home_screens/home/views/homes_view.dart';

class MainController extends GetxController {
  var selectIndex = 0.obs;

  final screens = [HomesView(), BookingView(), FavoriteView(), AccountView()];

  void changeScreen(int index) {
    selectIndex.value = index;
  }
}
