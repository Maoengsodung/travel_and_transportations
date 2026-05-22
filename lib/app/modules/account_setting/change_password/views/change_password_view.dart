import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/constant.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  ChangePasswordView({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          title: Text(
            'Change Password',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          flexibleSpace: Container(
            color: gradientBottomColor,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Align(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 60),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: borderColor, width: 1),
                            color: Colors.white,
                          ),
                          child: Image.asset('assets/icons/back-outline.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 29, left: 20, top: 40),
            child: Column(
              children: [
                // Form Password
                _formPassword(controller: controller, key: _formKey),

                const SizedBox(height: 30),
                // Button Changes pass
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: gradientTopColor,
                  ),
                  child: TextButton(
                    onPressed: () async {
                      bool isValid = controller.validatePassword();
                      if (isValid) {
                        Get.toNamed(Routes.OTP);
                        await Future.delayed(const Duration(seconds: 3));
                        Get.snackbar(
                          'Message',
                          'This your OTO from SMS 123456',
                        );
                        controller.clearTextFields();
                      }
                    },
                    child: Text(
                      'Update Password',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _formPassword extends StatelessWidget {
  const _formPassword({super.key, required this.controller});

  final ChangePasswordController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            'Choose a New Password',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            maxLines: 2,
            'Enter and confirm your password to regain access',
            style: TextStyle(fontSize: 14, color: greyColor),
          ),

          const SizedBox(height: 40),
          Form(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                // Old Pass
                Text(
                  'Old Password',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: controller.oldPasswordController,
                  obscureText: controller.oldPassword.value,
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  decoration: InputDecoration(
                    errorText: controller.passwordError.value.isEmpty
                        ? null
                        : controller.passwordError.value,
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.obscureOldPassword();
                      },
                      icon: controller.oldPassword.value
                          ? Icon(
                              CupertinoIcons.eye_slash,
                              size: 18,
                              color: greyColor,
                            )
                          : Icon(
                              CupertinoIcons.eye,
                              size: 18,
                              color: greyColor,
                            ),
                    ),
                    hintText: 'Enter your new password',
                    hintStyle: TextStyle(color: greyColor, fontSize: 14),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: greyBorder,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: greyBorder, width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Nes pass
                Text(
                  'New Password',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: controller.newPasswordController,
                  obscureText: controller.newPassword.value,
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  decoration: InputDecoration(
                    errorText: controller.passwordError.value.isEmpty
                        ? null
                        : controller.passwordError.value,
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.obscureNewPassword();
                      },
                      icon: controller.newPassword.value
                          ? Icon(
                              CupertinoIcons.eye_slash,
                              size: 18,
                              color: greyColor,
                            )
                          : Icon(
                              CupertinoIcons.eye,
                              size: 18,
                              color: greyColor,
                            ),
                    ),
                    hintText: 'Enter your new password',
                    hintStyle: TextStyle(color: greyColor, fontSize: 14),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: greyBorder,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: greyBorder, width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Confirm pass
                Text(
                  'Confirm Password',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: controller.confirmPasswordController,
                  obscureText: controller.newPassword.value,
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  decoration: InputDecoration(
                    errorText: controller.passwordError.value.isEmpty
                        ? null
                        : controller.passwordError.value,
                    hintText: 'Confirm your password',
                    hintStyle: TextStyle(color: greyColor, fontSize: 14),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: greyBorder,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: greyBorder, width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
