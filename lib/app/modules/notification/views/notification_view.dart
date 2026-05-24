import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_transportation/app/constant/constant.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
          child: Column(
            children: [
              // Header
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Notifications",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView(
                  children: [
                    sectionTitle("Today"),

                    notificationItem(
                      icon: 'assets/icons/success.png',
                      color: Colors.green,
                      title: "Booking successful",
                      subtitle: "Your ride has been booked...",
                      time: "2 mins ago",
                      isUnread: true,
                    ),

                    notificationItem(
                      icon: 'assets/icons/cash.png',
                      color: Colors.orange,
                      title: "Payment & Fare",
                      subtitle: "Payment completed successfully",
                      time: "2 mins ago",
                      isUnread: true,
                    ),

                    notificationItem(
                      icon: 'assets/icons/date-time.png',
                      color: Color(0xff6A5FF5),
                      title: "Scheduled Booking",
                      subtitle: "Your ride is scheduled for 7:00 AM...",
                      time: "2 mins ago",
                    ),

                    const SizedBox(height: 20),

                    sectionTitle("Yesterday"),

                    notificationItem(
                      icon: 'assets/icons/promotion-outline.png',
                      color: Colors.orange,
                      title: "Special discount",
                      subtitle: "Special offer for you ride again...",
                      time: "04 May 2026",
                    ),

                    notificationItem(
                      icon: 'assets/icons/promotion-outline.png',
                      color: Colors.orange,
                      title: "Promotions & Offers",
                      subtitle: "Get 15% off your next ride!",
                      time: "03 May 2026",
                    ),

                    notificationItem(
                      icon: 'assets/icons/date-time.png',
                      color: Color(0xff6A5FF5),
                      title: "Scheduled Booking",
                      subtitle: "Your ride is scheduled for 7:00 AM...",
                      time: "2 mins ago",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget notificationItem({
    required String icon,
    required Color color,
    required String title,
    required String subtitle,
    required String time,
    bool isUnread = false,
  }) {
    return Column(
      children: [
        Row(
          children: [
            // Icon Box
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(icon, color: color),
            ),

            const SizedBox(width: 15),

            // Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(subtitle, style: TextStyle(color: greyColor)),
                ],
              ),
            ),

            // Time
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (isUnread)
                  Container(
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      color: Color(0xff6A5FF5),
                      shape: BoxShape.circle,
                    ),
                  ),
                Text(time, style: TextStyle(color: greyColor)),
              ],
            ),
          ],
        ),

        const SizedBox(height: 15),
        Divider(color: lineColor),
        const SizedBox(height: 15),
      ],
    );
  }
}
