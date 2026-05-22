import 'package:get/get.dart';

class SelectSeatController extends GetxController {
  final List<String> deckNames = ['Lower deck', 'Upper deck'];
  List<Map<String, String>> data = [
    {
      'lower_deck': 'Lower deck',
      'upper_deck': 'Upper deck',
      'bed': 'assets/icons/bed.png',
    },
  ];
}
