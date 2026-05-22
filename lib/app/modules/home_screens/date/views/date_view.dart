import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/date_controller.dart';

class DateView extends GetView<DateController> {
  DateView({super.key});
  final controller = Get.put(DateController());
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
