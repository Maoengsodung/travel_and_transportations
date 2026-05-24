import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/modules/account_setting/booking/controllers/booking_controller.dart';
import 'app/routes/app_pages.dart';
import 'app/services/app_translatations.dart';

void main() {
  Get.put(BookingController(), permanent: true);
  runApp(
    GetMaterialApp(
      // Languages
      translations: AppTranslations(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),

      // end
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

        // Background Screen
        scaffoldBackgroundColor: Color(0xffF5F5F5),
        // font
        fontFamily: 'Roboto',
      ),
    ),
  );
}
