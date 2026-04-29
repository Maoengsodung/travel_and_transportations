import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/constant.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          toolbarHeight: 80,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [gradientTopColor, gradientBottom2Color],
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'History Booking',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Image.asset(
                        'assets/icons/option.png',
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 20),
        itemCount: booking.length,
        itemBuilder: (context, index) {
          final book = booking[index];

          return Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: lineColor, width: 1),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          // about company
                          Row(
                            children: [
                              Image.asset(book['logo']!),
                              const SizedBox(width: 15),

                              // name company
                              Column(
                                crossAxisAlignment: .start,
                                children: [
                                  Text(
                                    book['name']!,
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 5),

                                  Row(
                                    children: [
                                      // Type of transport
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                          color: cateColor,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 5,
                                          ),
                                          child: Text(
                                            book['type']!,
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: btnColorNormal,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),

                                      // Seats
                                      Text(
                                        book['seat']!,
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 12,
                                          color: greyColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),

                          // time
                          Row(
                            children: [
                              Text(
                                book['start']!,
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),

                              const SizedBox(width: 10),
                              Expanded(
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Container(
                                        height: 1,
                                        color: lineColor,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      book['duration']!,
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: greyColor,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Flexible(
                                      child: Container(
                                        height: 1,
                                        color: lineColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),

                              // arrived
                              Text(
                                book['arrived']!,
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),

                          // Station Transports
                          Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              Text(
                                book['station']!,
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                  color: greyColor,
                                ),
                              ),
                              Text(
                                book['direction']!,
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                  color: greyColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),

                          // Type travel & Price
                          Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              Text(
                                book['type_bus']!,
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "USD ${book['price']!}",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Row(
                      children: List.generate(35, (index) {
                        return Expanded(
                          child: Container(
                            height: 1,
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            color: lineStyleColor,
                          ),
                        );
                      }),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          // date travel
                          Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              Text(
                                'Date of travel',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                  color: greyColor,
                                ),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/next.png',
                                    width: 18,
                                    height: 18,
                                    color: Colors.green.shade500,
                                  ),

                                  const SizedBox(width: 5),
                                  Text(
                                    book['date_travel']!,
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          // Date return
                          Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              Text(
                                'Date of return',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                  color: greyColor,
                                ),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/back.png',
                                    width: 18,
                                    height: 18,
                                    color: Colors.red.shade500,
                                  ),

                                  const SizedBox(width: 5),
                                  Text(
                                    book['date_return']!,
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          // Rating
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: cateColor,
                              ),
                              child: Center(
                                child: Text(
                                  'Rating',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: btnColorNormal,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Btn Booking again
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [gradientLeft, gradientRight],
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Booking again',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
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
              ),

              // Icon options
              Positioned(
                top: 20,
                right: 15,
                child: Image.asset(
                  'assets/icons/option.png',
                  width: 20,
                  height: 20,
                  color: greyColor,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
