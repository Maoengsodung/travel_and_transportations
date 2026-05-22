import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_transportation/app/constant/constant.dart';
import 'package:travel_transportation/app/data/data.dart';

class HistoryController extends GetxController {
  var historyData = data.obs;

  void deleteBooking(int id) {
    Get.defaultDialog(
      backgroundColor: Colors.white,
      title: '',
      radius: 30,
      content: Column(
        children: [
          Image.asset('assets/icons/imageDelete.png', width: 130, height: 130),
          const SizedBox(height: 15),
          const Text(
            "Delete History Booking?",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: const Text(
              "Are you sure you want to delete this booking?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: greyColor,
                fontFamily: 'Roboto',
              ),
            ),
          ),
          const SizedBox(height: 30),

          // Btn
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                // cancel
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: btnCancel,
                  ),
                  child: SizedBox(
                    width: 110,
                    child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: gradientRight,
                        ),
                      ),
                    ),
                  ),
                ),

                // Delete
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red.shade600,
                  ),
                  child: SizedBox(
                    width: 140,
                    child: TextButton(
                      onPressed: () {
                        historyData.removeWhere((item) => item['id'] == id);
                        Get.back();
                        Get.snackbar(
                          "Message",
                          "History Booking removed successfully",
                          colorText: Colors.white,
                        );
                      },
                      child: const Text(
                        'Delete',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
