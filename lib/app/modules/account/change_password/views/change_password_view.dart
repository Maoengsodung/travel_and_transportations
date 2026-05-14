import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/constant.dart';
import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({super.key});
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
      body: Padding(
        padding: const EdgeInsets.only(right: 29, left: 20, top: 40),
        child: Column(
          children: [
            // Form Password
            _formPassword(controller: controller),

            const SizedBox(height: 30),
            // Button Changes pass
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: gradientTopColor,
              ),
              child: TextButton(
                onPressed: () {},
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
            obscureText: controller.securePassword.value,
            style: const TextStyle(color: Colors.black, fontSize: 14),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  controller.obscurePassword();
                },
                icon: controller.securePassword.value
                    ? Icon(CupertinoIcons.eye, size: 18, color: greyColor)
                    : Icon(
                        CupertinoIcons.eye_slash,
                        size: 18,
                        color: greyColor,
                      ),
              ),
              hintText: 'Enter your old password',
              hintStyle: TextStyle(color: greyColor, fontSize: 14),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: greyBorder, width: 1.5),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: greyBorder, width: 2),
              ),
            ),
          ),
          const SizedBox(height: 20),

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
            obscureText: controller.securePassword.value,
            style: const TextStyle(color: Colors.black, fontSize: 14),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  controller.obscurePassword();
                },
                icon: controller.securePassword.value
                    ? Icon(CupertinoIcons.eye, size: 18, color: greyColor)
                    : Icon(
                        CupertinoIcons.eye_slash,
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
                borderSide: const BorderSide(color: greyBorder, width: 1.5),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: greyBorder, width: 2),
              ),
            ),
          ),
          const SizedBox(height: 20),

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
            obscureText: controller.securePassword.value,
            style: const TextStyle(color: Colors.black, fontSize: 14),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  controller.obscurePassword();
                },
                icon: controller.securePassword.value
                    ? Icon(CupertinoIcons.eye, size: 18, color: greyColor)
                    : Icon(
                        CupertinoIcons.eye_slash,
                        size: 18,
                        color: greyColor,
                      ),
              ),
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
                borderSide: const BorderSide(color: greyBorder, width: 1.5),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: greyBorder, width: 2),
              ),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
