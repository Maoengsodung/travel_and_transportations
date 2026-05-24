import 'package:get/get.dart';

class BookingController extends GetxController {
  final bookings = <Map<String, dynamic>>[].obs;

  void addBooking(Map<String, dynamic> booking) {
    bookings.add(booking);
  }
}
