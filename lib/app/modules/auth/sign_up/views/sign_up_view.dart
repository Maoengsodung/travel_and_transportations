import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/constant.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  SignUpView({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 30),
        children: [
          Center(
            child: Image.asset(
              'assets/icons/login.png',
              width: 300,
              height: 300,
            ),
          ),
          const Text(
            'Sign In',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // form sign in
                  _formSignIn(formKey: _formKey, controller: controller),
                  const SizedBox(height: 20),

                  // Check Box
                  _rememberMe(controller: controller),
                  const SizedBox(height: 35),

                  // Button sign in
                  _buttonSignUp(formKey: _formKey),
                ],
              ),
            ),
          ),

          const SizedBox(height: 40),
          // Don't have an account
          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'I have already account? ',
                    style: TextStyle(fontSize: 14, color: greyColor),
                  ),

                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.toNamed(Routes.SIGN_IN);
                      },
                    text: 'Sign In',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: gradientRight,
                    ),
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

class _rememberMe extends StatelessWidget {
  const _rememberMe({super.key, required this.controller});

  final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.isChecked.toggle();
        },
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: controller.isChecked.value
                      ? gradientRight
                      : Colors.grey,
                  width: 2,
                ),
                color: controller.isChecked.value
                    ? gradientRight
                    : Colors.transparent,
              ),
              child: controller.isChecked.value
                  ? const Icon(Icons.check, color: Colors.white, size: 16)
                  : null,
            ),
            const SizedBox(width: 14),
            const Text(
              'Remember me',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _buttonSignUp extends StatelessWidget {
  const _buttonSignUp({super.key, required GlobalKey<FormState> formKey})
    : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: gradientRight,
      ),
      child: TextButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) ;
        },
        child: Text(
          'Sign Up',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _formSignIn extends StatelessWidget {
  const _formSignIn({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.controller,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: .start,
          children: [
            // User Name
            const Text(
              'Full Name',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              style: const TextStyle(color: Colors.black, fontSize: 14),
              decoration: InputDecoration(
                hintText: 'Sodung Maoeng',
                hintStyle: TextStyle(color: greyColor, fontSize: 14),
                prefixIcon: Image.asset(
                  'assets/icons/user_setting.png',
                  color: greyColor,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: lineColor, width: 1.5),
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'require phone number';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),

            // Phone
            const Text(
              'Phone',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              style: const TextStyle(color: Colors.black, fontSize: 14),
              decoration: InputDecoration(
                hintText: '(+855) 12 345 678',
                hintStyle: TextStyle(color: greyColor, fontSize: 14),
                prefixIcon: Image.asset(
                  'assets/icons/phone.png',
                  color: greyColor,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: lineColor, width: 1.5),
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'require phone number';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),

            // Password
            const Text(
              'Password',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              obscureText: controller.obscurePassword.value,
              style: const TextStyle(color: Colors.black, fontSize: 14),
              decoration: InputDecoration(
                hintText: 'YsfsY@#1235',
                hintStyle: TextStyle(color: greyColor, fontSize: 14),
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.toglePassword();
                  },
                  icon: controller.obscurePassword.value
                      ? Icon(CupertinoIcons.eye, size: 18, color: greyColor)
                      : Icon(
                          CupertinoIcons.eye_slash,
                          size: 18,
                          color: greyColor,
                        ),
                ),
                prefixIcon: Image.asset(
                  'assets/icons/pass.png',
                  color: greyColor,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: lineColor, width: 1.5),
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'require password';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
