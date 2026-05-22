import 'package:get/get.dart';

class PaymentMethodsController extends GetxController {
  var selectedIndex = 0.obs;

  void changePayment(int index) {
    selectedIndex.value = index;
  }

  List<Map<String, String>> paymentMethod = [
    {
      'bank': 'assets/logo/acleda.png',
      'name': 'ACLEDA Bank',
      'code': '*** *** *** 168',
    },
    {
      'bank': 'assets/logo/aba.png',
      'name': 'ABA Bank',
      'code': '*** *** *** 168',
    },
    {
      'bank': 'assets/logo/canadiya.jpg',
      'name': 'Canadia Bank',
      'code': '*** *** *** 168',
    },
    {
      'bank': 'assets/logo/ftb.png',
      'name': 'FTB Bank',
      'code': '*** *** *** 168',
    },
    {
      'bank': 'assets/logo/wing.png',
      'name': 'Wing Bank',
      'code': '*** *** *** 168',
    },
  ];
}
