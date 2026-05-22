import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/constant.dart';
import '../../../../routes/app_pages.dart';
import '../../edit_profile/views/edit_profile.dart';
import '../../languages/controllers/languages_controller.dart';
import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  AccountView({super.key});
  final LanguagesController languageController = Get.put(LanguagesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: .start,
        children: [
          // Header profile
          _headerProfile(),

          Expanded(child: _accountInformation()),
        ],
      ),
    );
  }

  Padding _accountInformation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          // Account info
          Text(
            'Account',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),

          // Account Informations
          Container(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  // account info
                  ListTile(
                    onTap: () {
                      Get.toNamed(Routes.INFOPROFILE);
                    },
                    contentPadding: EdgeInsets.zero,
                    minLeadingWidth: 0,
                    horizontalTitleGap: 10,
                    leading: Image.asset('assets/icons/user_setting.png'),
                    title: Text(
                      'Account Information',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: greyColor,
                      ),
                    ),
                    trailing: Icon(Icons.navigate_next_sharp),
                  ),

                  // Change pass
                  ListTile(
                    onTap: () {
                      Get.toNamed(Routes.CHANGE_PASSWORD);
                    },
                    contentPadding: EdgeInsets.zero,
                    minLeadingWidth: 0,
                    horizontalTitleGap: 10,
                    leading: Image.asset('assets/icons/key.png'),
                    title: Text(
                      'Change Password',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: greyColor,
                      ),
                    ),
                    trailing: Icon(Icons.navigate_next_sharp),
                  ),

                  // history booking
                  ListTile(
                    onTap: () {
                      Get.toNamed(Routes.HISTORY);
                    },
                    contentPadding: EdgeInsets.zero,
                    minLeadingWidth: 0,
                    horizontalTitleGap: 10,
                    leading: Image.asset('assets/icons/history_setting.png'),
                    title: Text(
                      'History Booking',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: greyColor,
                      ),
                    ),
                    trailing: Icon(Icons.navigate_next_sharp),
                  ),

                  // notification
                  ListTile(
                    onTap: () {
                      Get.toNamed(Routes.NOTIFICATION);
                    },
                    contentPadding: EdgeInsets.zero,
                    minLeadingWidth: 0,
                    horizontalTitleGap: 10,
                    leading: Image.asset('assets/icons/noti_setting.png'),
                    title: Text(
                      'Notifications',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: greyColor,
                      ),
                    ),
                    trailing: Icon(Icons.navigate_next_sharp),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(Routes.PAYMENT_METHODS);
                    },
                    contentPadding: EdgeInsets.zero,
                    minLeadingWidth: 0,
                    horizontalTitleGap: 10,
                    leading: Image.asset('assets/icons/payment.png'),
                    title: Text(
                      'Payment Method'.tr,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: greyColor,
                      ),
                    ),
                    trailing: Icon(Icons.navigate_next_sharp),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Account Setting
          const Text(
            "Settings",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      Get.toNamed(Routes.LANGUAGES);
                    },
                    contentPadding: EdgeInsets.zero,
                    minLeadingWidth: 0,
                    horizontalTitleGap: 10,
                    leading: Image.asset('assets/icons/language.png'),
                    title: Text(
                      'Languages'.tr,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: greyColor,
                      ),
                    ),
                    trailing: Obx(
                      () => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            languageController.selectedFlag.value,
                            style: const TextStyle(fontSize: 18),
                          ),

                          const SizedBox(width: 6),

                          Text(
                            languageController.selectedLanguage.value,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Get.bottomSheet(
                        // bottom Sheet
                        _bottomSheet(),
                      );
                    },
                    contentPadding: EdgeInsets.zero,
                    minLeadingWidth: 0,
                    horizontalTitleGap: 10,
                    leading: Image.asset('assets/icons/help.png'),
                    title: Text(
                      'Help',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: greyColor,
                      ),
                    ),
                    trailing: Icon(Icons.navigate_next_sharp),
                  ),

                  // About App
                  ListTile(
                    onTap: () {
                      Get.toNamed(Routes.ABOUT_APP);
                    },
                    contentPadding: EdgeInsets.zero,
                    minLeadingWidth: 0,
                    horizontalTitleGap: 10,
                    leading: Image.asset('assets/icons/about.png'),
                    title: Text(
                      'About App',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: greyColor,
                      ),
                    ),
                    trailing: Icon(Icons.navigate_next_sharp),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _bottomSheet extends StatelessWidget {
  const _bottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: 230,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.circular(30),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    'Help',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusGeometry.circular(50),
                        color: lineColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Icon(Icons.close, size: 19, color: greyColor),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(height: 1, color: lineColor),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  minLeadingWidth: 0,
                  horizontalTitleGap: 10,
                  leading: Image.asset(
                    'assets/icons/service.png',
                    width: 18,
                    height: 18,
                  ),
                  title: Text(
                    'Chat with us',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  trailing: Icon(Icons.navigate_next_rounded),
                ),
              ),

              const Divider(height: 1, color: lineColor),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  minLeadingWidth: 0,
                  horizontalTitleGap: 10,
                  leading: Image.asset(
                    'assets/icons/phone.png',
                    width: 18,
                    height: 18,
                  ),
                  title: Text(
                    'Bus support',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    '(+855) 12345678',
                    style: TextStyle(fontSize: 13, color: greyColor),
                  ),
                  trailing: Icon(Icons.navigate_next_rounded),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _headerProfile extends StatelessWidget {
  const _headerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [gradientTopColor, gradientBottomColor],
          begin: AlignmentGeometry.topCenter,
          end: AlignmentGeometry.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 70),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            // Header
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  'My Profile',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.offAllNamed(Routes.SIGN_IN);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: Image.asset('assets/icons/logout.png'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),
            // Profile
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.orange.withOpacity(0.3),
                          ),
                          child: Image.asset(
                            'assets/icons/imageUser.png',
                            width: 60,
                            height: 60,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              'Sodung Maoeng',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '+(855) 12345678',
                              style: TextStyle(fontSize: 14, color: greyColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => EditProfile());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffEEF0FF),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 10,
                          ),
                          child: Text(
                            'Edit',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: gradientTopColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
