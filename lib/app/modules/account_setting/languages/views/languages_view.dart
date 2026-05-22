import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_transportation/app/constant/constant.dart';

import '../controllers/languages_controller.dart';

class LanguagesView extends GetView<LanguagesController> {
  LanguagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(Icons.arrow_back_rounded),
                  ),
                  const SizedBox(width: 20),
                  // Search
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.search, color: Colors.grey.shade500),
                          hintText: 'Search',
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Title
              const Text(
                'Choose the language',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Select your preferred language below.',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 30),

              // Selected
              const Text(
                'You Selected',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),

              // Selected Language Card
              Obx(() {
                final selected = controller.languages.firstWhere(
                  (language) =>
                      language['name'] == controller.selectedLanguage.value,
                );

                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: gradientRight),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Text(
                        selected['flag']!,
                        style: const TextStyle(fontSize: 24),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Text(
                          selected['name']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      const CircleAvatar(
                        radius: 10,
                        backgroundColor: gradientRight,
                        child: Icon(Icons.check, color: Colors.white, size: 14),
                      ),
                    ],
                  ),
                );
              }),

              const SizedBox(height: 30),

              // All Languages
              const Text(
                'All Languages',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 12),

              // Language List
              Expanded(
                child: ListView.builder(
                  itemCount: controller.languages.length,
                  itemBuilder: (context, index) {
                    final language = controller.languages[index];

                    return Obx(() {
                      final isSelected =
                          controller.tempLanguage.value == language['name'];
                      return GestureDetector(
                        onTap: () {
                          controller.selectLanguage(
                            language: language['name']!,
                            flag: language['flag']!,
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? gradientRight.withOpacity(0.1)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: isSelected ? gradientRight : borderColor,
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                language['flag']!,
                                style: const TextStyle(fontSize: 24),
                              ),

                              const SizedBox(width: 15),

                              Expanded(
                                child: Text(
                                  language['name']!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),

                              Container(
                                height: 22,
                                width: 22,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected
                                        ? gradientRight
                                        : borderColor,
                                  ),
                                  color: isSelected
                                      ? gradientRight
                                      : Colors.transparent,
                                ),
                                child: isSelected
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 14,
                                      )
                                    : null,
                              ),
                            ],
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),

              // Continue Button
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    final selected = controller.languages.firstWhere(
                      (language) =>
                          language['name'] == controller.tempLanguage.value,
                    );
                    controller.saveLanguage(
                      languageCode: selected['code']!,
                      countryCode: selected['country']!,
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: gradientRight,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  child: const Text(
                    'Apply',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
