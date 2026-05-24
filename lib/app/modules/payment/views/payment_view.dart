import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/constant.dart';
import '../../../routes/app_pages.dart';
import '../../account_setting/booking/controllers/booking_controller.dart';
import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          title: Text(
            'Payment Methods',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
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
                          width: 45,
                          height: 45,
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                // Payment options
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        const Text(
                          'Choose payment',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          height: 420,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.paymentMethod.length,
                            itemBuilder: (context, index) {
                              final data = controller.paymentMethod[index];

                              return Obx(() {
                                final isSelected =
                                    controller.selectedIndex.value == index;
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1.5,
                                        color: isSelected
                                            ? greyBorder
                                            : lineColor,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                      color: borderColor.withOpacity(0.4),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: ListTile(
                                        onTap: () {
                                          controller.changePayment(index);
                                        },
                                        contentPadding: EdgeInsets.zero,
                                        minLeadingWidth: 0,
                                        horizontalTitleGap: 15,
                                        leading: ClipRRect(
                                          borderRadius:
                                              BorderRadiusGeometry.circular(10),
                                          child: Image.asset(
                                            data['bank']!,
                                            width: 45,
                                            height: 45,
                                          ),
                                        ),
                                        title: Text(
                                          data['name']!,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                        subtitle: Text(
                                          data['code']!,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: greyColor,
                                          ),
                                        ),
                                        trailing: isSelected
                                            ? Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: btnCancel,
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 15,
                                                      vertical: 5,
                                                    ),
                                                child: Text(
                                                  'Default',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: gradientRight,
                                                  ),
                                                ),
                                              )
                                            : null,
                                      ),
                                    ),
                                  ),
                                );
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // summary booking
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: const Text(
                          'Summary Booking',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Divider(height: 1, color: lineColor),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            // Booking No
                            Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                const Text(
                                  'Booking No.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  controller.bookingNo,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),

                            // Ticket
                            Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                const Text(
                                  'Ticket (s)',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  '${controller.ticket}x',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),

                            // Seat (s)
                            Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                const Text(
                                  'Seat (s)',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  controller.seats.join(', '),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),

                            // Seat (s)
                            Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                const Text(
                                  'Promo code',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                const Text(
                                  '\$00.00',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),

                            // Seat (s)
                            Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                const Text(
                                  'Price',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  '\$${controller.unitPrice.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Divider(height: 1, color: lineColor),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            // Total
                            Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                const Text(
                                  'Total Amount',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  '\$${controller.totalAmount.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 25),
                            // Button
                            ElevatedButton(
                              onPressed: () {
                                final bookingController =
                                    Get.find<BookingController>();

                                bookingController.addBooking(
                                  controller.makeBookingData(),
                                );

                                Get.offAllNamed(Routes.MAIN);

                                Get.snackbar('Success', 'Booking successfully');
                              },
                              child: Center(child: Text('Pay Now')),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: gradientRight,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    10,
                                  ),
                                ),
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
