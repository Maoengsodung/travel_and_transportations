import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../constant/constant.dart';
import '../../../routes/app_pages.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  HistoryView({super.key});

  final controller = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'History Booking',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          toolbarHeight: 80,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [gradientTopColor, gradientBottom2Color],
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                'Select All',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: Obx(() {
        if (controller.historyData.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Image.asset('assets/icons/histoty_empty.png'),
                const SizedBox(height: 20),
                const Text(
                  'Nothing to show in history',
                  style: TextStyle(fontSize: 16, color: greyColor),
                ),

                const SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: gradientRight,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Get.toNamed(Routes.SEARCH_CATEGORY);
                  },
                  child: Text('Explore Now'),
                ),
              ],
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.only(
            right: 16,
            left: 16,
            top: 20,
            bottom: 100,
          ),
          itemCount: controller.historyData.length,
          itemBuilder: (context, index) {
            final book = controller.historyData[index];
            return Slidable(
              endActionPane: ActionPane(
                motion: const DrawerMotion(),
                extentRatio: 0.25,
                children: [
                  CustomSlidableAction(
                    backgroundColor: Colors.transparent,
                    onPressed: (context) {
                      controller.deleteBooking(book['id']);
                    },
                    child: Center(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: backgorundIcon,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset('assets/icons/delete.png'),
                      ),
                    ),
                  ),
                ],
              ),
              child: Stack(
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
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: cateColor,
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 2,
                                ),
                                color: lineStyleColor,
                              ),
                            );
                          }),
                        ),

                        // Date & rating
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
                                onTap: () {
                                  Get.bottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        height: Get.height * 0.62,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            topRight: Radius.circular(30),
                                          ),
                                        ),

                                        child: Column(
                                          children: [
                                            // header
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                top: 20,
                                                bottom: 15,
                                              ),

                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    'Rating your experience',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),

                                                  IconButton(
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    icon: Icon(
                                                      Icons.close,
                                                      color: Colors.deepPurple,
                                                      size: 30,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Divider(
                                              height: 1,
                                              color: borderColor,
                                            ),

                                            // contents
                                            Expanded(
                                              child: SingleChildScrollView(
                                                padding: EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                  top: 30,
                                                ),

                                                child: Column(
                                                  children: [
                                                    // title
                                                    const Text(
                                                      'What do you think about this?',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18,
                                                        color: Colors.black,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),

                                                    const SizedBox(height: 8),

                                                    const Text(
                                                      'Please rate it from 1 to 5.',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: greyColor,
                                                      ),
                                                    ),

                                                    const SizedBox(height: 30),

                                                    // rating
                                                    _rating(),
                                                    const SizedBox(height: 35),

                                                    // comment
                                                    const Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        'Tell us about your experience',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 12),

                                                    // form comment
                                                    _formComment(),
                                                    const SizedBox(height: 35),

                                                    // button submit
                                                    _submitButton(),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
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
                                onTap: () {
                                  Get.toNamed(
                                    Routes.SELECT_SEAT,
                                    arguments: book,
                                  );
                                },
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
              ),
            );
          },
        );
      }),
    );
  }
}

class _formComment extends StatelessWidget {
  const _formComment({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 5,

      decoration: InputDecoration(
        hintText: 'Write your feedback...',
        contentPadding: const EdgeInsets.all(15),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Colors.deepPurple),
        ),
      ),
    );
  }
}

class _rating extends StatelessWidget {
  const _rating({super.key});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 0,
      minRating: 1,
      itemCount: 5,
      itemSize: 40,
      unratedColor: Colors.grey.shade400,
      itemPadding: const EdgeInsets.symmetric(horizontal: 6),

      itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),

      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}

class _submitButton extends StatelessWidget {
  const _submitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: gradientRight,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          Get.back();
        },
        child: const Text(
          'Submit',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
