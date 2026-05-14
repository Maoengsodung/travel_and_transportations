import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/constant.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final nameController = TextEditingController(text: 'Sodung Maoeng');
  final numberController = TextEditingController(text: '012 345 678');
  final dateController = TextEditingController(text: '05 May 2026');
  final genderController = TextEditingController(text: 'Male');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          title: Text(
            'Information Profile',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          flexibleSpace: Container(
            color: gradientBottomColor,
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 100),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      left: 20,
                      top: 60,
                      bottom: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        // Name User
                        Text(
                          'Full Name',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: nameController,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: greyColor,
                              fontSize: 14,
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
                                color: greyBorder,
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
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Number Phone
                        Text(
                          'Phone Number',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: numberController,

                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: greyColor,
                              fontSize: 14,
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
                                color: greyBorder,
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
                          ),
                        ),
                        const SizedBox(height: 15),

                        // Date of birth
                        Text(
                          'Date of birth',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: dateController,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: greyColor,
                              fontSize: 14,
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
                                color: greyBorder,
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
                          ),
                        ),
                        const SizedBox(height: 15),

                        // Gender
                        Text(
                          'Gender',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: genderController,

                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: greyColor,
                              fontSize: 14,
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
                                color: greyBorder,
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
                          ),
                        ),
                        const SizedBox(height: 40),

                        // Save Button
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: gradientRight,
                          ),
                          child: TextButton(
                            onPressed: () {
                              Get.back();
                              Get.snackbar(
                                "Message",
                                "You had updated information account success.",
                                colorText: Colors.white,
                                duration: Duration(seconds: 3),
                              );
                            },
                            child: Text(
                              'Save',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 65,
                right: 0,
                left: 0,
                child: Center(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(width: 1.5, color: Colors.white),
                          color: Colors.orange.shade100,
                        ),
                        child: Image.asset(
                          'assets/icons/imageUser.png',
                          width: 70,
                          height: 70,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Image.asset('assets/icons/camera.png'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
