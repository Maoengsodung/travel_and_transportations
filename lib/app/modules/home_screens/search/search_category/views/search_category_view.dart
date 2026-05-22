import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constant/constant.dart';
import '../../../../../routes/app_pages.dart';
import '../controllers/search_category_controller.dart';

class SearchCategoryView extends GetView<SearchCategoryController> {
  SearchCategoryView({super.key});
  final controller = Get.put(SearchCategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          flexibleSpace: Container(
            color: gradientBottomColor,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Align(
                // alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 60),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: borderColor, width: 1),
                            color: Colors.white,
                          ),
                          child: Image.asset('assets/icons/back-outline.png'),
                        ),
                      ),
                      const SizedBox(width: 15),
                      // Search Box
                      Expanded(
                        child: TextField(
                          onChanged: controller.searchBooking,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Image.asset(
                              'assets/icons/search.png',
                              color: greyColor,
                            ),
                            hintText: 'Search transportation...',
                            hintStyle: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              color: greyColor,
                            ),
                          ),
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Divider(height: 1, color: borderColor),
            const SizedBox(height: 15),

            Text(
              'Popular traveling',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            // Item search
            Expanded(
              child: Obx(() {
                if (controller.searchText.value.isEmpty) {
                  return ListView.builder(
                    itemCount: controller.searchHistory.length,

                    itemBuilder: (context, index) {
                      final history = controller.searchHistory[index];

                      return ListTile(
                        leading: const Icon(Icons.history),

                        title: Text(history),

                        trailing: IconButton(
                          icon: const Icon(Icons.close),

                          onPressed: () {
                            controller.removeHistory(history);
                          },
                        ),

                        onTap: () {
                          controller.searchBooking(history);
                        },
                      );
                    },
                  );
                }

                // Not found data
                if (controller.filteredBooking.isEmpty) {
                  return Center(child: Text('Search not found!'));
                }

                return ListView.builder(
                  padding: EdgeInsets.only(top: 10),
                  itemCount: controller.filteredBooking.length,
                  itemBuilder: (context, index) {
                    final search = controller.filteredBooking[index];

                    return Column(
                      children: [
                        const Divider(height: 1, color: lineColor),

                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.SEARCH);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                Text(
                                  search['station'],
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: greyColor,
                                  ),
                                ),
                                Image.asset('assets/icons/circum_route.png'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
