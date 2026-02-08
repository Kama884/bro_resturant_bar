import 'package:get/get.dart';

class ReservationController extends GetxController {
  var GuestCount = 1.obs;

  void increment() => GuestCount++;
  void decrement() {
    if (GuestCount > 1) GuestCount--;
  }
}
