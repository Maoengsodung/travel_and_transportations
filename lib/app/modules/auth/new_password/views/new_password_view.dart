import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/constant.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/new_password_controller.dart';

class NewPasswordView extends GetView<NewPasswordController> {
  NewPasswordView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: .center,
          children: [
            Center(
              child: const Text(
                'Create new password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 270,
              child: const Text(
                'Your new password must to different than previous used passwords',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: greyColor),
              ),
            ),

            // Form Password
            _formPassword(controller: controller, key: _formKey),

            const SizedBox(height: 30),
            // Button Changes pass
            Obx(
              () => Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: gradientTopColor,
                ),
                child: TextButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () async {
                          bool isValid = controller.validatePassword();

                          if (isValid) {
                            controller.isLoading.value = true;

                            await Future.delayed(const Duration(seconds: 2));

                            controller.isLoading.value = false;

                            Get.snackbar(
                              'Success',
                              'You reset password successfully',
                            );

                            Get.offAllNamed(Routes.SIGN_IN);
                          }
                        },

                  child: controller.isLoading.value
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Reset Password',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _formPassword extends StatelessWidget {
  const _formPassword({super.key, required this.controller});

  final NewPasswordController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: .start,
        children: [
          const SizedBox(height: 70),
          Form(
            child: Column(
              crossAxisAlignment: .start,
              children: [
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
                  controller: controller.newPassController,
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
                  controller: controller.confirmPassController,
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
