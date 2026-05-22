import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/constant.dart';
import '../../../data/data.dart';
import '../controllers/select_seat_controller.dart';

class SelectSeatView extends GetView<SelectSeatController> {
  SelectSeatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 100),
            child: ListView(
              padding: const EdgeInsets.only(bottom: 220),
              children: [
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    _selectSeate(controller: controller),

                    const SizedBox(height: 25),

                    const Text(
                      'Know your seat types',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 15),
                    _seatType(),
                  ],
                ),
              ],
            ),
          ),

          // Header
          Positioned(
            right: 0,
            left: 0,
            top: 0,
            child: Container(
              width: double.infinity,
              height: 115,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.white, width: 2),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 45),
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
                        child: Image.asset(
                          'assets/icons/back-outline.png',
                          color: greyColor,
                        ),
                      ),
                    ),

                    Expanded(
                      child: Center(
                        child: Text(
                          'Select seats',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 40, height: 40),
                  ],
                ),
              ),
            ),
          ),
          // Bottom scrol
          DraggableScrollableSheet(
            initialChildSize: 0.18,
            minChildSize: 0.18,
            maxChildSize: 1.0,
            snap: true,
            snapSizes: const [0.23, 0.60, 1.0],
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(17, 17, 26, 0.1),
                      blurRadius: 16,
                      spreadRadius: 0,
                      offset: Offset(0, 4),
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(17, 17, 26, 0.1),
                      blurRadius: 24,
                      spreadRadius: 0,
                      offset: Offset(0, 8),
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(17, 17, 26, 0.1),
                      blurRadius: 56,
                      spreadRadius: 0,
                      offset: Offset(0, 16),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 15),

                    // SMALL TOP CONTAINER
                    Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),

                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        controller: scrollController,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return ListTile(title: Text(data[index]['name']));
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _seatType extends StatelessWidget {
  const _seatType({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          // Title
          ListTile(
            onTap: () {},
            leading: Text(
              'Type',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),

            trailing: Text(
              'Sleeper',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),

          const Divider(height: 1, color: lineColor),
          // Avarilable
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              onTap: () {},
              leading: Text(
                'Available',
                style: TextStyle(fontSize: 12, color: greyColor),
              ),

              trailing: Image.asset('assets/icons/bed.png', color: borderColor),
            ),
          ),

          const Divider(height: 1, color: lineColor),
          // Already booked
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              onTap: () {},
              leading: Text(
                'Already booked',
                style: TextStyle(fontSize: 12, color: greyColor),
              ),

              trailing: Image.asset(
                'assets/icons/bed.png',
                color: Colors.green.withOpacity(0.5),
              ),
            ),
          ),

          const Divider(height: 1, color: lineColor),
          // female booked
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              onTap: () {},
              leading: Text(
                'Booked by female passenger',
                style: TextStyle(fontSize: 12, color: greyColor),
              ),

              trailing: Image.asset(
                'assets/icons/bed.png',
                color: Colors.pink.withOpacity(0.3),
              ),
            ),
          ),

          const Divider(height: 1, color: lineColor),
          // male booked
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              onTap: () {},
              leading: Text(
                'Booked by male passenger',
                style: TextStyle(fontSize: 12, color: greyColor),
              ),

              trailing: Image.asset('assets/icons/bed.png', color: greyBorder),
            ),
          ),
        ],
      ),
    );
  }
}

class _selectSeate extends StatelessWidget {
  const _selectSeate({super.key, required this.controller});

  final SelectSeatController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 434,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 30),
        scrollDirection: Axis.horizontal,
        itemCount: controller.deckNames.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/driver.png',
                          color: greyColor,
                        ),
                        const SizedBox(width: 15),
                        Text(
                          controller.deckNames[index],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    for (int i = 0; i < 5; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/icons/bed.png',
                              color: borderColor,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/icons/bed.png',
                                  color: borderColor,
                                ),
                                const SizedBox(width: 8),
                                Image.asset(
                                  'assets/icons/bed.png',
                                  color: borderColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
