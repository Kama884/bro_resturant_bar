import 'package:bro_resturant_bar/app/modules/ordering/controller/cart_controller.dart';
import 'package:bro_resturant_bar/app/routes/app_routes.dart';
import 'package:bro_resturant_bar/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomCartBar extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (cartController.totalItems == 0) return SizedBox.shrink();

      return SafeArea(
        child: Padding(
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
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${cartController.totalItems} items",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 0.025.toresponsive(context),
                      ),
                    ),
                    SizedBox(width: 0.025.w(context)),
                    Text(
                      '|',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 0.027.toresponsive(context),
                      ),
                    ),
                    SizedBox(width: 0.025.w(context)),
                    Text(
                      "Rs. ${cartController.totalPrice}",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 0.025.toresponsive(context),
                      ),
                    ),
                  ],
                ),

                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.ORDER_INFO);
                  },
                  child: Text(
                    "View Order",
                    style: TextStyle(color: Colors.blue[900]),
                  ),
                ),
              ],
              //SizedBox(height: 0.030.h(context))
            ),
          ),
        ),
      );
    });
  }
}
