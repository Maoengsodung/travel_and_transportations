import 'package:get/get.dart';

class PaymentController extends GetxController {
  final booking = <String, dynamic>{}.obs;
  var selectedIndex = 0.obs;

  // change payment bank
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

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null) {
      booking.value = Map<String, dynamic>.from(Get.arguments);
    }
  }

  String get bookingNo => booking['bookingNo'] ?? '#V0001';

  List get seats => booking['seats'] ?? [];

  int get ticket => booking['ticket'] ?? 0;

  double get unitPrice =>
      double.tryParse(booking['unitPrice'].toString()) ?? 0.0;

  double get totalAmount =>
      double.tryParse(booking['totalAmount'].toString()) ?? 0.0;

  // after payment send data to booking page
  Map<String, dynamic> get book =>
      Map<String, dynamic>.from(booking['book'] ?? {});

  Map<String, dynamic> makeBookingData() {
    return {
      ...book,
      'bookingNo': bookingNo,
      'selectedSeats': seats,
      'ticket': ticket,
      'unitPrice': unitPrice,
      'totalAmount': totalAmount,
      'status': 'Paid',
    };
  }
}
