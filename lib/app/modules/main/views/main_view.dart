import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Obx(() => controller.screens[controller.selectIndex.value]),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 30),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.white, width: 2),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(100, 100, 111, 0.2),
                blurRadius: 29,
                spreadRadius: 0,
                offset: Offset(0, 7),
              ),
            ],
          ),
          height: 70,
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              navItem("assets/icons/home.png", "Home", 0),
              navItem("assets/icons/booking.png", "Booking", 1),
              navItem("assets/icons/save.png", "Save", 2),
              navItem("assets/icons/user.png", "Account", 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget navItem(String icon, String title, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.selectIndex(index),
        child: Obx(() {
          bool active = controller.selectIndex.value == index;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            // margin: const EdgeInsets.all(5),
            // padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: active ? Colors.white : null,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  Image.asset(
                    icon,
                    color: active ? Color(0xff6A5FF5) : Color(0xff6D6D6D),
                    width: 20,
                    height: 20,
                  ),
                  // Image.asset(asset, color: Colors.white),
                  const SizedBox(height: 5),
                  active
                      ? Text(
                          title,
                          style: active
                              ? TextStyle(
                                  color: Color(0xff6A5FF5),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                )
                              : TextStyle(
                                  color: Color(0xff6D6D6D),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                        )
                      : Text(
                          title,
                          style: active
                              ? TextStyle(
                                  color: Color(0xff6A5FF5),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                )
                              : TextStyle(
                                  color: Color(0xff6D6D6D),
                                  fontSize: 12,
                                ),
                        ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
