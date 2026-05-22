import 'package:get/get.dart';

import '../modules/account_setting/about_app/bindings/about_app_binding.dart';
import '../modules/account_setting/about_app/views/about_app_view.dart';
import '../modules/account_setting/account/bindings/account_binding.dart';
import '../modules/account_setting/account/views/account_view.dart';
import '../modules/account_setting/booking/bindings/booking_binding.dart';
import '../modules/account_setting/booking/views/booking_view.dart';
import '../modules/account_setting/change_password/bindings/change_password_binding.dart';
import '../modules/account_setting/change_password/views/change_password_view.dart';
import '../modules/account_setting/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/account_setting/edit_profile/views/info_profile_view.dart';
import '../modules/account_setting/languages/bindings/languages_binding.dart';
import '../modules/account_setting/languages/views/languages_view.dart';
import '../modules/account_setting/otp/bindings/otp_binding.dart';
import '../modules/account_setting/otp/views/otp_view.dart';
import '../modules/account_setting/payment_methods/bindings/payment_methods_binding.dart';
import '../modules/account_setting/payment_methods/views/payment_methods_view.dart';
import '../modules/auth/create_new_password/bindings/create_new_password_binding.dart';
import '../modules/auth/create_new_password/views/create_new_password_view.dart';
import '../modules/auth/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/auth/forgot_password/views/forgot_password_view.dart';
import '../modules/auth/get_start/bindings/get_start_binding.dart';
import '../modules/auth/get_start/views/get_start_view.dart';
import '../modules/auth/new_password/bindings/new_password_binding.dart';
import '../modules/auth/new_password/views/new_password_view.dart';
import '../modules/auth/otp_confirm/bindings/otp_confirm_binding.dart';
import '../modules/auth/otp_confirm/views/otp_confirm_view.dart';
import '../modules/auth/sign_in/bindings/sign_in_binding.dart';
import '../modules/auth/sign_in/views/sign_in_view.dart';
import '../modules/auth/sign_up/bindings/sign_up_binding.dart';
import '../modules/auth/sign_up/views/sign_up_view.dart';
import '../modules/favorite/bindings/favorite_binding.dart';
import '../modules/favorite/views/favorite_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home_screens/date/bindings/date_binding.dart';
import '../modules/home_screens/date/views/date_view.dart';
import '../modules/home_screens/discount/bindings/discount_binding.dart';
import '../modules/home_screens/discount/views/discount_view.dart';
import '../modules/home_screens/home/bindings/homes_binding.dart';
import '../modules/home_screens/home/views/homes_view.dart';
import '../modules/home_screens/loading/bindings/loading_binding.dart';
import '../modules/home_screens/loading/views/loading_view.dart';
import '../modules/home_screens/search/bindings/search_binding.dart';
import '../modules/home_screens/search/search_category/bindings/search_category_binding.dart';
import '../modules/home_screens/search/search_category/views/search_category_view.dart';
import '../modules/home_screens/search/views/search_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/payment/bindings/payment_binding.dart';
import '../modules/payment/views/payment_view.dart';
import '../modules/select_seat/bindings/select_seat_binding.dart';
import '../modules/select_seat/views/select_seat_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.GET_START;

  static final routes = [
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
      page: () => HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => AccountView(),
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
      name: _Paths.INFOPROFILE,
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
      page: () => ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.HOMES,
      page: () => HomesView(),
      binding: HomesBinding(),
    ),
    GetPage(
      name: _Paths.LANGUAGES,
      page: () => LanguagesView(),
      binding: LanguagesBinding(),
    ),
    GetPage(name: _Paths.DATE, page: () => DateView(), binding: DateBinding()),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => const FavoriteView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.GET_START,
      page: () => const GetStartView(),
      binding: GetStartBinding(),
    ),
    GetPage(
      name: _Paths.LOADING,
      page: () => const LoadingView(),
      binding: LoadingBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_NEW_PASSWORD,
      page: () => const CreateNewPasswordView(),
      binding: CreateNewPasswordBinding(),
    ),
    GetPage(
      name: _Paths.OTP_CONFIRM,
      page: () => const OtpConfirmView(),
      binding: OtpConfirmBinding(),
    ),
    GetPage(
      name: _Paths.NEW_PASSWORD,
      page: () => NewPasswordView(),
      binding: NewPasswordBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_SEAT,
      page: () => SelectSeatView(),
      binding: SelectSeatBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_METHODS,
      page: () => PaymentMethodsView(),
      binding: PaymentMethodsBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => const PaymentView(),
      binding: PaymentBinding(),
    ),

    GetPage(
      name: _Paths.ABOUT_APP,
      page: () => const AboutAppView(),
      binding: AboutAppBinding(),
    ),
  ];
}
