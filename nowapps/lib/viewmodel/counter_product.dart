import 'package:get/get.dart';

class CounterController extends GetxController {
  final _counters = List<int>.filled(10, 0).obs;

  List<int> get counters => _counters.toList();

  int getCounter(int index) {
    return _counters[index];
  }

  void increment(int index) {
    _counters[index]++;
  }

  void decrement(int index) {
    if (_counters[index] > 0) {
      _counters[index]--;
    }
  }
}
