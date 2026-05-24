import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/constant.dart';
import '../controllers/about_app_controller.dart';

class AboutAppView extends GetView<AboutAppController> {
  const AboutAppView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          title: Text(
            'About App',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 70,
          flexibleSpace: Container(
            color: Colors.white,
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
                          width: 40,
                          height: 40,
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/logo/logo_app.png'),
                radius: 60,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Our Travel & Transportation app is designed to make traveling easier, '
              'safer, and more convenient for everyone. Users can easily book tickets, '
              'explore routes, and manage their trips in one place. We provide reliable'
              ' transportation services with secure payment methods and real-time travel '
              'updates. Our goal is to deliver a smooth and comfortable travel experience '
              'for every journey. With a modern and user-friendly design, the app helps save '
              'time and simplifies transportation planning. Thank you for choosing our platform '
              'to travel with confidence and convenience. We are continuously improving our services '
              'to better meet user needs. Our support team is always ready to assist you anytime '
              'you need help. The app is built with advanced technology to ensure fast and stable '
              'performance. We value your feedback and use it to enhance the overall experience. Stay '
              'connected with us for the latest updates and new features.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 70),
            const Text(
              'V8.8.8.0',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.normal,
                color: greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
