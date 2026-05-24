import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_transportation/app/constant/constant.dart';
import 'package:travel_transportation/app/modules/auth/get_start/views/finish_get_start_view.dart';

import '../controllers/get_start_controller.dart';

class GuineLineView extends GetView<GetStartController> {
  const GuineLineView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: .start,
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.5, 1],
                colors: [Colors.transparent, gradientBottomColor],
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
            child: Image.asset(
              'assets/icons/get_start_image.png',
              width: double.infinity,
              height: 600,
              fit: BoxFit.cover,
            ),
          ),
          // Text
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 25),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                const Text(
                  'Discover Amazing Destinations',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Choose comfortable transportations and book your trip easily for a smooth travel experience.',
                  style: TextStyle(fontSize: 16, color: greyColor),
                ),
                const SizedBox(height: 110),
                // Button & Indicator
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    // Indicator
                    Row(
                      children: [
                        Container(
                          width: 7,
                          height: 7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xffD9D9D9),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          width: 50,
                          height: 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: gradientRight,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          width: 7,
                          height: 7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xffD9D9D9),
                          ),
                        ),
                      ],
                    ),

                    // Button
                    Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: gradientRight,
                      ),
                      child: TextButton(
                        onPressed: () {
                          Get.to(
                            () => FinishGetStartView(),
                            transition: Transition.rightToLeft,
                            duration: const Duration(milliseconds: 300),
                          );
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
