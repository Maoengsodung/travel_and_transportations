import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../constant/constant.dart';
import '../../../data/data.dart';
import '../../../routes/app_pages.dart';
import '../controllers/select_seat_controller.dart';

class SelectSeatView extends GetView<SelectSeatController> {
  SelectSeatView({super.key});

  final Map<String, dynamic> book = Get.arguments as Map<String, dynamic>;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 100),
            child: ListView(
              padding: const EdgeInsets.only(bottom: 265),
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
          _appBar(),

          // Bottom scrol
          DraggableScrollableSheet(
            initialChildSize: 0.28,
            minChildSize: 0.28,
            maxChildSize: 1.0,
            snap: true,
            snapSizes: const [0.28, 0.60, 1.0],
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
                      child: ListView(
                        padding: EdgeInsets.zero,
                        controller: scrollController,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              crossAxisAlignment: .start,
                              children: [
                                // Information about transportation
                                ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  minLeadingWidth: 0,
                                  horizontalTitleGap: 10,
                                  title: Text(
                                    book['name'].toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment: .start,
                                    children: [
                                      Text(
                                        '${(book['start'] + " - " + book['arrived']).toString()}',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: greyColor,
                                        ),
                                      ),
                                      Text(
                                        book['type_bus'].toString(),
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: greyColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  trailing: InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.MAP);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(5),
                                        color: btnCancel,
                                      ),
                                      child: Text(
                                        'View map',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: gradientRight,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 15),

                                // image
                                SizedBox(
                                  height: 120,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: book['image'].length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        width: 250,
                                        margin: const EdgeInsets.only(
                                          right: 10,
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          child: Image.asset(
                                            book['image'][index],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),

                                const SizedBox(height: 20),
                                // Services
                                Text(
                                  'Amenities for you use',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/bottle.png',
                                        color: greyColor,
                                      ),
                                      const SizedBox(width: 15),
                                      Text(
                                        'Water Bottle',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/charger.png',
                                        color: greyColor,
                                      ),
                                      const SizedBox(width: 15),
                                      Text(
                                        'USB port for charger',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/air condi.png',
                                        color: greyColor,
                                      ),
                                      const SizedBox(width: 15),
                                      Text(
                                        'Air conditioner',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/blanket.png',
                                        color: greyColor,
                                      ),
                                      const SizedBox(width: 15),
                                      Text(
                                        'Blanket',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/bed_sheet.png',
                                        color: greyColor,
                                      ),
                                      const SizedBox(width: 15),
                                      Text(
                                        'Bed sheet',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),

                                // Rating
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      minLeadingWidth: 0,
                                      horizontalTitleGap: 10,
                                      title: const Text(
                                        'Ratings',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      trailing: Column(
                                        mainAxisAlignment: .center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.star_rate_rounded,
                                                color: Colors.orange,
                                                size: 30,
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                '4.5',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            '28 ratings',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: greyColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.verified,
                                          color: Colors.green,
                                          size: 24,
                                        ),
                                        SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            'Real feedback from verified travelers',
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 20),
                                    ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: ratings.length,
                                      itemBuilder: (context, index) {
                                        final item = ratings[index];
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 10,
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                item['star'].toString(),
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              const Icon(
                                                Icons.star_rounded,
                                                size: 25,
                                                color: Colors.orange,
                                              ),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                child: LinearPercentIndicator(
                                                  padding: EdgeInsets.zero,
                                                  lineHeight: 8,
                                                  percent:
                                                      item['percent'] as double,
                                                  backgroundColor: borderColor,
                                                  progressColor: gradientRight,
                                                  barRadius:
                                                      const Radius.circular(20),
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Text(
                                                '${((item['percent'] as double) * 100).toInt()}%',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: greyColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),

                                // Review
                                Row(
                                  mainAxisAlignment: .spaceBetween,
                                  children: [
                                    const Text(
                                      'Review',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const Text(
                                      'See All',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: gradientRight,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  height: 160,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: comments.length,
                                    itemBuilder: (context, index) {
                                      final item = comments[index];
                                      return Container(
                                        width: 300,
                                        margin: const EdgeInsets.only(
                                          right: 12,
                                        ),
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(color: lineColor),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 25,
                                                  backgroundImage: AssetImage(
                                                    item['image'],
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        item['name'],
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                      Text(
                                                        item['date'],
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                          color: greyColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Expanded(
                                              child: Text(
                                                item['comment'],
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  height: 1.35,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Row(
                                              mainAxisAlignment: .spaceBetween,
                                              children: [
                                                Row(
                                                  children: List.generate(5, (
                                                    starIndex,
                                                  ) {
                                                    return const Icon(
                                                      Icons.star,
                                                      size: 20,
                                                      color: Colors.orange,
                                                    );
                                                  }),
                                                ),
                                                Text(
                                                  '${item['rating']} stars',
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 40),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),

      // Total
      bottomSheet: Obx(() {
        if (controller.selectedSeats.isEmpty) {
          return const SizedBox.shrink();
        }
        return Container(
          height: 140,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: lineColor),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${controller.selectedSeats.length} seat selected',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Text(
                    'USD ${controller.totalAmount(book['price']).toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              // Button  select seat
              ElevatedButton(
                onPressed: () {
                  final selectedSeats = controller.selectedSeats.toList();
                  final price = double.parse(book['price'].toString());
                  final total = controller.totalAmount(price);
                  Get.toNamed(
                    Routes.PAYMENT,
                    arguments: {
                      'bookingNo':
                          '#V${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}',
                      'seats': selectedSeats,
                      'ticket': selectedSeats.length,
                      'unitPrice': price,
                      'totalAmount': total,
                      'book': book,
                    },
                  );
                },
                child: Center(child: Text('Booking Now')),
                style: ElevatedButton.styleFrom(
                  backgroundColor: gradientRight,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _appBar extends StatelessWidget {
  const _appBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      left: 0,
      top: 0,
      child: Container(
        width: double.infinity,
        height: 115,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white, width: 2)),
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

              trailing: Image.asset(
                'assets/icons/bed.png',
                color: Colors.green.withOpacity(0.5),
              ),
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

              trailing: Image.asset('assets/icons/bed.png', color: borderColor),
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
        itemBuilder: (context, deckIndex) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Obx(() {
                  final deckSeats = deckIndex == 0
                      ? controller.lowerDeckSeats
                      : controller.upperDeckSeats;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/driver.png',
                            color: greyColor,
                            width: 35,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            controller.deckNames[deckIndex],
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: (deckSeats.length / 3).ceil(),
                          itemBuilder: (context, rowIndex) {
                            final startIndex = rowIndex * 3;

                            final leftSeat1 = deckSeats[startIndex];
                            final leftSeat2 = startIndex + 1 < deckSeats.length
                                ? deckSeats[startIndex + 1]
                                : null;
                            final rightSeat = startIndex + 2 < deckSeats.length
                                ? deckSeats[startIndex + 2]
                                : null;

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 18),
                              child: Row(
                                mainAxisAlignment: .spaceBetween,
                                children: [
                                  _seatItem(leftSeat1),
                                  const SizedBox(width: 10),

                                  if (leftSeat2 != null) _seatItem(leftSeat2),

                                  if (rightSeat != null) _seatItem(rightSeat),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _seatItem(Map<String, dynamic> seat) {
    return GestureDetector(
      onTap: () {
        controller.toggleSeat(seat);
      },
      child: Obx(
        () => Image.asset(
          'assets/icons/bed.png',
          color: controller.seatColor(seat),
          width: 38,
          height: 55,
        ),
      ),
    );
  }
}
