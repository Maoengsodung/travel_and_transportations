import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomesController extends GetxController {
  var selectedIndex = 0.obs;
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  Rx<DateTime?> selectedDateReturn = Rx<DateTime?>(null);

  void changeCate(int index) {
    selectedIndex.value = index;
  }

  //date
  void openDatePicker() {
    DateTime tempDate = selectedDate.value ?? DateTime.now();

    Get.bottomSheet(
      StatefulBuilder(
        builder: (context, setState) {
          return Container(
            height: 550,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: 70,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: CalendarDatePicker(
                    initialDate: tempDate,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2035),

                    onDateChanged: (date) {
                      setState(() {
                        tempDate = date;
                      });
                    },
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ),

                    const SizedBox(width: 15),

                    ElevatedButton(
                      onPressed: () {
                        selectedDate.value = tempDate;
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff2563EB),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 28,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        'Done',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }

  // date return
  void openDateReturnPicker() {
    DateTime tempDate = selectedDateReturn.value ?? DateTime.now();

    Get.bottomSheet(
      StatefulBuilder(
        builder: (context, setState) {
          return Container(
            height: 550,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: 70,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: CalendarDatePicker(
                    initialDate: tempDate,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2035),

                    onDateChanged: (date) {
                      setState(() {
                        tempDate = date;
                      });
                    },
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ),

                    const SizedBox(width: 15),

                    ElevatedButton(
                      onPressed: () {
                        selectedDateReturn.value = tempDate;
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff2563EB),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 28,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        'Done',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
    print('Date ${selectedDate}');
  }
}
