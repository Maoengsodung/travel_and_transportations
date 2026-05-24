import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/constant.dart';
import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  FavoriteView({super.key});
  final favoriteController = Get.put(FavoriteController());
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
                        'My Favorite',
                        style: TextStyle(
                          fontSize: 18,
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
      body: Obx(
        () => controller.favorites.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    Image.asset('assets/images/empty_card.png'),
                    const SizedBox(height: 15),
                    const Text(
                      'No Favorites Yet',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.only(right: 16, left: 16, top: 20),
                itemCount: controller.favorites.length,
                itemBuilder: (context, index) {
                  final book = controller.favorites[index];

                  return Stack(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: lineColor, width: 1),
                          ),
                          child: Padding(
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
                                            Row(
                                              crossAxisAlignment: .end,
                                              children: [
                                                // Type of transport
                                                Icon(
                                                  Icons.star_rounded,
                                                  size: 24,
                                                  color: Colors.orange,
                                                ),
                                                const SizedBox(width: 5),

                                                // Seats
                                                Text(
                                                  book['rating'].toString(),
                                                  style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              'Review (${book['review'].toString()}+)',
                                              style: TextStyle(
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
                                    Row(
                                      children: [
                                        Text(
                                          book['type_bus']!,
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 12,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          book['seat']!,
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
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
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: 15,
                        child: Obx(() {
                          final isFav = favoriteController.isFavorite(book);

                          return GestureDetector(
                            onTap: () {
                              favoriteController.toggleFavorite(book);
                            },
                            child: Image.asset(
                              'assets/icons/bookmark.png',
                              width: 20,
                              height: 20,
                              color: isFav ? gradientBottom2Color : greyColor,
                            ),
                          );
                        }),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
