import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_transportation/app/constant/constant.dart';

class SelectSeatController extends GetxController {
  final List<String> deckNames = ['Lower deck', 'Upper deck'];
  final selectedSeats = <String>[].obs;

  final lowerDeckSeats = <Map<String, dynamic>>[
    {'id': 'A1', 'status': 'available'},
    {'id': 'A2', 'status': 'already_booked'},
    {'id': 'A3', 'status': 'female'},
    {'id': 'A4', 'status': 'male'},

    {'id': 'B1', 'status': 'available'},
    {'id': 'B2', 'status': 'available'},
    {'id': 'B3', 'status': 'already_booked'},
    {'id': 'B4', 'status': 'available'},

    {'id': 'C1', 'status': 'female'},
    {'id': 'C2', 'status': 'available'},
    {'id': 'C3', 'status': 'male'},
    {'id': 'C4', 'status': 'available'},
  ].obs;

  final upperDeckSeats = <Map<String, dynamic>>[
    {'id': 'D1', 'status': 'available'},
    {'id': 'D2', 'status': 'available'},
    {'id': 'D3', 'status': 'already_booked'},
    {'id': 'D4', 'status': 'available'},

    {'id': 'E1', 'status': 'available'},
    {'id': 'E2', 'status': 'female'},
    {'id': 'E3', 'status': 'available'},
    {'id': 'E4', 'status': 'male'},

    {'id': 'F1', 'status': 'available'},
    {'id': 'F2', 'status': 'already_booked'},
    {'id': 'F3', 'status': 'available'},
    {'id': 'F4', 'status': 'available'},
  ].obs;

  double totalAmount(double price) {
    return selectedSeats.length * price;
  }

  void toggleSeat(Map<String, dynamic> seat) {
    if (seat['status'] != 'available') return;

    final seatId = seat['id'].toString();

    if (selectedSeats.contains(seatId)) {
      selectedSeats.remove(seatId);
    } else {
      selectedSeats.add(seatId);
    }

    update();
  }

  Color seatColor(Map<String, dynamic> seat) {
    final seatId = seat['id'].toString();

    if (selectedSeats.contains(seatId)) {
      return Colors.orange;
    }

    switch (seat['status']) {
      case 'available':
        return Colors.green.withOpacity(0.5);
      case 'already_booked':
        return borderColor;
      case 'female':
        return Colors.pink.withOpacity(0.3);
      case 'male':
        return const Color(0xffC5CCFF);
      default:
        return Colors.grey;
    }
  }
}
