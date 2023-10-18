import 'package:get/get.dart';

class CounterController extends GetxController {
  var count = 0.obs; // Observable variable for the counter

  void increment() {
    count.value++; // Increment the counter
  }
}
