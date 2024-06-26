import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nowapps/viewmodel/counter_product.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final CounterController controller = Get.find();
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () async {
            await Future.delayed(const Duration(milliseconds: 500));
            controller.decrement(index);
            if (controller.counters[index] > 0) {
              Get.snackbar("Added",
                  "${controller.counters[index].toString()} product added",
                  duration: const Duration(milliseconds: 500));
            }
          },
        ),
        Center(
          child: Obx(
            () => Text(
              controller.counters[index].toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () async {
            await Future.delayed(const Duration(milliseconds: 500));
            controller.increment(index);
            Get.snackbar("Added",
                "${controller.counters[index].toString()} product added",
                duration: const Duration(milliseconds: 500));
          },
        ),
      ],
    );
  }
}
