import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/constant.dart';
import '../controllers/payment_methods_controller.dart';

class PaymentMethodsView extends GetView<PaymentMethodsController> {
  PaymentMethodsView({super.key});
  final _formKey = GlobalKey<FormState>();
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
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
                      height: 450,
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
                                    color: isSelected ? greyBorder : lineColor,
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
                                            padding: const EdgeInsets.symmetric(
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

                    // Button
                    ElevatedButton(
                      onPressed: () {
                        Get.bottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          _bottomSheet(formKey: _formKey),
                        );
                      },
                      child: Center(child: Text('Add Payment Method')),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _bottomSheet extends StatelessWidget {
  const _bottomSheet({super.key, required GlobalKey<FormState> formKey})
    : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.62,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),

      child: Column(
        crossAxisAlignment: .start,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Add Payment Method',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.close, color: Colors.deepPurple, size: 30),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: borderColor),

          // contents
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        // Old Pass
                        // Name Card
                        const Text(
                          'Name on Card',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Full Name',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: greyColor,
                              fontSize: 12,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: lineColor,
                                width: 1.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: greyBorder,
                                width: 2,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'required name on card';
                            }
                          },
                        ),
                        const SizedBox(height: 20),

                        // Card Number
                        const Text(
                          'Card Number',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            hintText: '*** *** *** ***',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: greyColor,
                              fontSize: 12,
                            ),
                            suffixIcon: Image.asset(
                              'assets/icons/super_card.png',
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: lineColor,
                                width: 1.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: greyBorder,
                                width: 2,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'required card number';
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: .start,
                                children: [
                                  const Text(
                                    'Expiration',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: '00/00',
                                      hintStyle: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: greyColor,
                                        fontSize: 14,
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            vertical: 5,
                                            horizontal: 10,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: lineColor,
                                          width: 1.5,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: greyBorder,
                                          width: 2,
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 1,
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'required expiration';
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 30),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: .start,
                                children: [
                                  const Text(
                                    'CVV',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: '***',
                                      hintStyle: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: greyColor,
                                        fontSize: 14,
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            vertical: 5,
                                            horizontal: 10,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: lineColor,
                                          width: 1.5,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: greyBorder,
                                          width: 2,
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 1,
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'required cvv';
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Button
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) ;
                    },
                    child: Center(child: Text('Add')),
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
            ),
          ),
        ],
      ),
    );
  }
}
