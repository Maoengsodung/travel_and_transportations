import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_transportation/app/constant/constant.dart';

import '../controllers/discount_controller.dart';

class DiscountView extends GetView<DiscountController> {
  const DiscountView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: gradientBottomColor,
          title: Text(
            'Discount',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          toolbarHeight: 80,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(right: 20, left: 20, top: 0),
              itemCount: discount.length,
              itemBuilder: (context, index) {
                final dis = discount[index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Image.asset(
                      dis,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
