import 'package:flutter/material.dart' hide SearchController;
import 'package:get/get.dart';
import 'package:travel_transportation/app/constant/constant.dart';
import 'package:travel_transportation/app/data/data.dart';

import '../../../../routes/app_pages.dart';
import '../../../favorite/controllers/favorite_controller.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  SearchView({super.key});
  final favoriteController = Get.put(FavoriteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 70),
        child: Column(
          children: [
            // Search Bar
            _searchBar(),

            // Item search
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 20),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final book = data[index];
                  return Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.SELECT_SEAT, arguments: book);
                        },
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
                                    Image.asset(book['logo']),
                                    const SizedBox(width: 15),

                                    // name company
                                    Column(
                                      crossAxisAlignment: .start,
                                      children: [
                                        Text(
                                          book['name'],
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(height: 5),

                                        Row(
                                          children: [
                                            // Rating
                                            Icon(
                                              Icons.star,
                                              size: 20,
                                              color: Colors.orange.shade700,
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
                                            const SizedBox(width: 10),
                                            // Review
                                            RichText(
                                              text: TextSpan(
                                                style: DefaultTextStyle.of(
                                                  context,
                                                ).style,
                                                children: [
                                                  TextSpan(
                                                    text: 'Review',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: greyColor,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        ' (${book['review']}+)'
                                                            .toString(),
                                                    style: TextStyle(
                                                      fontFamily: 'Roboto',
                                                      fontSize: 12,
                                                      color: greyColor,
                                                    ),
                                                  ),
                                                ],
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
          ],
        ),
      ),
    );
  }
}

class _searchBar extends StatelessWidget {
  const _searchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
