import 'package:get/get.dart';

import '../modules/account/bindings/account_binding.dart';
import '../modules/account/change_password/bindings/change_password_binding.dart';
import '../modules/account/change_password/views/change_password_view.dart';
import '../modules/account/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/account/edit_profile/views/info_profile_view.dart';
import '../modules/account/views/account_view.dart';
import '../modules/booking/bindings/booking_binding.dart';
import '../modules/booking/views/booking_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/discount/bindings/discount_binding.dart';
import '../modules/home/discount/views/discount_view.dart';
import '../modules/home/search/bindings/search_binding.dart';
import '../modules/home/search/search_category/bindings/search_category_binding.dart';
import '../modules/home/search/search_category/views/search_category_view.dart';
import '../modules/home/search/views/search_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(name: _Paths.HOME, page: () => HomeView(), binding: HomeBinding()),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING,
      page: () => const BookingView(),
      binding: BookingBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => const AccountView(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: _Paths.DISCOUNT,
      page: () => const DiscountView(),
      binding: DiscountBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => InfoProfileView(),
      binding: InfoProfileBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_CATEGORY,
      page: () => SearchCategoryView(),
      binding: SearchCategoryBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
  ];
}
