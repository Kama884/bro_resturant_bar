import 'package:bro_resturant_bar/app/modules/ordering/controller/cart_controller.dart';
import 'package:bro_resturant_bar/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: Row(
          children: [
            Text(
              'Select Order',
              style: TextStyle(
                fontSize: 0.028.toresponsive(context),
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 0.400.w(context)),

            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications, size: 32, color: Colors.black),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.040.w(context),
          vertical: 0.02.h(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 0.02.h(context)),

            _buildInfoBar(context),

            SizedBox(height: 0.01.h(context)),
            Divider(thickness: 1.5, color: Colors.blue[900]),
            SizedBox(height: 0.01.h(context)),

            Text(
              "Order Info",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 0.030.toresponsive(context),
              ),
            ),

            SizedBox(height: 0.03.h(context)),

            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: cartController.cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartController.cartItems[index];
                    return _buildOrderedListItems(
                      item,
                      cartController,
                      context,
                    );
                  },
                ),
              ),
            ),

            // Divider(color: Colors.grey[500]),
            _buildOrderBill(cartController, context),
            SizedBox(height: 0.030.h(context)),
            _buildButtomCartBar(cartController, context),
          ],
        ),
      ),
    );
  }

  _buildInfoBar(BuildContext context) {
    return Row(
      children: [
        Text(
          'Table: ',
          style: TextStyle(fontSize: 0.034.toresponsive(context)),
        ),
      ],
    );
  }

  _buildButtomCartBar(CartController controller, BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(0.015.toresponsive(context)),
        decoration: BoxDecoration(
          color: Colors.blue[900],
          borderRadius: BorderRadius.all(
            Radius.circular(0.020.toresponsive(context)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${controller.totalItems} items | Rs ${controller.GrandTotal.toStringAsFixed(1)}",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 0.025.toresponsive(context),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                /* Send POST request here */
              },
              child: Text(
                "Confirm Order",
                style: TextStyle(color: Colors.blue[900]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_buildOrderedListItems(item, CartController controller, BuildContext context) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 0.015.h(context)),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_circle_outline,
                      size: 0.030.toresponsive(context),
                    ),
                    label: Text(
                      "Add Note",
                      style: TextStyle(fontSize: 0.022.toresponsive(context)),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildQuantityControl(item, controller, context),
                SizedBox(height: 0.015.h(context)),

                Text(
                  "Rs ${item.price}",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          ],
        ),
      ),
      Divider(color: Colors.grey[500]),
    ],
  );
}

_buildQuantityControl(item, CartController controller, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      children: [
        IconButton(
          onPressed: () => controller.decrement(item),
          icon: const Icon(Icons.remove, size: 16),
        ),
        Obx(() => Text("${item.quantity.value}")),
        IconButton(
          onPressed: () => controller.increment(item),
          icon: const Icon(Icons.add, size: 16),
        ),
      ],
    ),
  );
}

_buildOrderBill(CartController controller, BuildContext context) {
  return Obx(
    () => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        OutlinedButton.icon(
          onPressed: () => Get.back(),
          icon: Icon(Icons.add, color: Colors.blue[900]),
          label: Text('Add More Items'),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.blue[900],

            //backgroundColor: Colors.blue[900],
          ),
        ),
        Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 0.01.h(context)),
            Row(
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 0.024.toresponsive(context),
                  ),
                ),
                SizedBox(width: 0.025.w(context)),
                Text(
                  "Rs ${controller.Total}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 0.024.toresponsive(context),
                  ),
                ),
              ],
            ),
            SizedBox(height: 0.01.h(context)),
            Row(
              children: [
                Text("Service Tax", style: TextStyle(color: Colors.grey[600])),
                SizedBox(width: 0.067.w(context)),
                Text(
                  "Rs ${controller.ServiceTax.toStringAsFixed(1)}",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            SizedBox(height: 0.01.h(context)),
            Row(
              children: [
                Text("Vat 13%", style: TextStyle(color: Colors.grey[600])),
                SizedBox(width: 0.067.w(context)),
                Text(
                  "Rs ${controller.Vat.toStringAsFixed(1)}",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            SizedBox(height: 0.02.h(context)),
            Text(
              "Grand Total   Rs ${controller.GrandTotal}",
              style: TextStyle(
                fontSize: 0.024.toresponsive(context),
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
