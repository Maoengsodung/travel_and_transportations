import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_transportation/app/constant/constant.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import '../search/search_category/views/search_category_view.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: .start,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [gradientTopColor, gradientBottomColor],
                begin: AlignmentGeometry.topCenter,
                end: AlignmentGeometry.bottomCenter,
                stops: [0.0, 5.0],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, top: 50),
              child: Column(
                children: [
                  // Header
                  _header(),

                  // Ticket Dashboard Search
                  _searchTicket(),

                  // Categories
                  _categories(controller: controller),
                ],
              ),
            ),
          ),

          // Discount
          _slideDiscount(),
        ],
      ),
    );
  }
}

class _slideDiscount extends StatelessWidget {
  const _slideDiscount({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 15),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                'Special Discount',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.DISCOUNT);
                },
                child: Text(
                  'View All',
                  style: TextStyle(
                    fontFamily: 'Roboto',

                    fontSize: 14,
                    color: btnColorNormal,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1,
              height: 120,
              //update indicator
              // onPageChanged: (index, reason) {
              //   controller.updateIndex(index);
              // },
            ),
            items: discount.map((item) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(15),
                  child: Image.asset(
                    item,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

// category
class _categories extends StatelessWidget {
  const _categories({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: SizedBox(
        height: 92,
        child: Padding(
          padding: const EdgeInsets.all(11),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: category.length,
            itemBuilder: (context, index) {
              final cate = category[index];

              return Obx(() {
                final isSelected = controller.selectedIndex.value == index;

                return GestureDetector(
                  onTap: () => controller.changeCate(index),
                  child: Container(
                    width: 63,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: cateColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          cate['icon']!,
                          width: 40,
                          color: isSelected ? btnColorNormal : greyColor,
                        ),
                        Text(
                          cate['name']!,
                          style: TextStyle(
                            fontSize: 12,
                            color: isSelected ? btnColorNormal : greyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
            },
          ),
        ),
      ),
    );
  }
}

// Search Ticket
class _searchTicket extends StatelessWidget {
  const _searchTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: .start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Padding(
                  padding: const EdgeInsets.only(
                    right: 15,
                    left: 15,
                    top: 20,
                    bottom: 15,
                  ),
                  child: Text(
                    'Bus Ticket',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Divider(height: 1, color: lineColor),

                // Bus
                ListTile(
                  onTap: () {
                    Get.to(() => SearchCategoryView());
                  },
                  leading: Image.asset('assets/icons/bus.png'),
                  title: Text(
                    'From',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: greyColor,
                    ),
                  ),
                ),
                const Divider(height: 1, color: lineColor),
                ListTile(
                  onTap: () {
                    Get.to(() => SearchCategoryView());
                  },
                  leading: Image.asset('assets/icons/bus.png'),
                  title: Text(
                    'To',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: greyColor,
                    ),
                  ),
                ),
                const Divider(height: 1, color: lineColor),

                // Date travel & Return
                ListTile(
                  onTap: () {
                    Get.to(() => SearchCategoryView());
                  },
                  leading: Image.asset('assets/icons/date.png'),
                  title: Text(
                    'Date of travel',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: greyColor,
                    ),
                  ),
                ),
                const Divider(height: 1, color: lineColor),
                ListTile(
                  onTap: () {
                    Get.to(() => SearchCategoryView());
                  },
                  leading: Image.asset('assets/icons/date.png'),
                  title: Text(
                    'Date of return (Optional)',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: greyColor,
                    ),
                  ),
                ),
                const Divider(height: 1, color: lineColor),

                // Button Search
                Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15, top: 23),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: btnColorNormal,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.SEARCH);
                      },
                      child: Text(
                        'Search',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 112,
            right: 15,
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(width: 1, color: lineColor),
                color: Colors.white,
              ),
              child: Image.asset(
                'assets/icons/switch.png',
                color: btnColorNormal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Header
class _header extends StatelessWidget {
  const _header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/icons/imageUser.png'),
              radius: 30,
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  'Welcome,',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                // Name User
                Text(
                  'Sodung Maoeng,',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.NOTIFICATION);
          },
          child: Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
            child: Image.asset(
              'assets/icons/notification.png',
              color: greyColor,
            ),
          ),
        ),
      ],
    );
  }
}
