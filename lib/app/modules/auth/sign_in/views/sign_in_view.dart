import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/constant.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  SignInView({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .start,
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
                          _formSignIn(
                            formKey: _formKey,
                            controller: controller,
                          ),
                          const SizedBox(height: 15),

                          // Forgot Password
                          _forgotpassword(),
                          const SizedBox(height: 30),

                          // Button sign in
                          _buttonSignIn(formKey: _formKey),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),
                  // Don't have an account
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Don’t have an account? ',
                            style: TextStyle(fontSize: 14, color: greyColor),
                          ),

                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(Routes.SIGN_UP);
                              },
                            text: 'Sign Up',
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
            ),
          ),
        ),
      ),
    );
  }
}

class _buttonSignIn extends StatelessWidget {
  const _buttonSignIn({super.key, required GlobalKey<FormState> formKey})
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
          if (_formKey.currentState!.validate()) {
            Get.offAllNamed(Routes.LOADING);
          }
        },
        child: Text(
          'Sign In',
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

class _forgotpassword extends StatelessWidget {
  const _forgotpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.FORGOT_PASSWORD);
      },
      child: Align(
        alignment: Alignment.topRight,
        child: const Text(
          'Forgot password?',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: gradientRight,
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
  final SignInController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: .start,
          children: [
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
                hintText: 'Enter your phone number',
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
                hintText: 'Enter your password',
                hintStyle: TextStyle(color: greyColor, fontSize: 14),
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.toglePassword();
                  },
                  icon: controller.obscurePassword.value
                      ? Icon(
                          CupertinoIcons.eye_slash,
                          size: 18,
                          color: greyColor,
                        )
                      : Icon(CupertinoIcons.eye, size: 18, color: greyColor),
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
