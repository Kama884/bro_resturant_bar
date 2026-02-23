import 'package:bro_resturant_bar/app/modules/ordering/controller/order_controller.dart';
import 'package:bro_resturant_bar/app/modules/ordering/widgets/order_card.dart';
import 'package:bro_resturant_bar/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderPage extends StatelessWidget {
  final controller = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.orderData.isEmpty) {
          return const Center(child: Text("No orders found"));
        }

        return ListView.builder(
          itemCount: controller.orderData.length,
          itemBuilder: (context, index) {
            return OrderCard(
              orderData: controller.orderData[index],
              index: index,
              onCancel: () {},
              onAdd: () {},
            );
          },
        );
      }),
    );
  }
}
