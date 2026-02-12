import 'package:bro_resturant_bar/app/modules/ordering/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:bro_resturant_bar/app/modules/ordering/models/food_model.dart';
import 'package:bro_resturant_bar/utils/responsive.dart';
import 'package:get/get.dart';

class FoodCard extends StatelessWidget {
  final Food foodData;
  final int index;

  const FoodCard({super.key, required this.foodData, required this.index});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    return Container(
      constraints: BoxConstraints(minWidth: 0.10.w(context)),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0.015.toresponsive(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // 1. Simple Image Section
          Expanded(
            flex: 55,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
              ),
              child: Image.network(
                foodData.image,
                height: 0.12.h(context),
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Center(
                  child: Icon(Icons.broken_image, size: 40, color: Colors.grey),
                ),
              ),
            ),
          ),

          // 2. Info Section (Name, Price, Add Button)
          Expanded(
            flex: 55,
            child: Padding(
              padding: EdgeInsets.all(0.008.toresponsive(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Food Name
                  Text(
                    foodData.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 0.017.toresponsive(context),
                    ),
                  ),

                  //SizedBox(height: 0.01.h(context)),
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rs. ${foodData.price}",
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontWeight: FontWeight.w900,
                          fontSize: 0.025.toresponsive(context),
                        ),
                      ),
                      SizedBox(height: 0.01.h(context)),

                      // Add Button
                      Obx(
                        () => foodData.quantity.value == 0
                            ? InkWell(
                                onTap: () => cartController.addToCart(foodData),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 0.010.w(context),
                                    //vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      0.020.toresponsive(context),
                                    ),
                                  ),
                                  child: Text(
                                    "Add",
                                    style: TextStyle(color: Colors.blue[900]),
                                  ),
                                ),
                              )
                            : Container(
                                constraints: BoxConstraints(
                                  // maxWidth: 0.5.w(context),
                                  minWidth: 0.10.w(context),
                                ),

                                decoration: BoxDecoration(
                                  color: Colors.blue[900],
                                  borderRadius: BorderRadius.circular(
                                    0.020.toresponsive(context),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 0.025.toresponsive(context),
                                      ),
                                      onPressed: () =>
                                          cartController.decrement(foodData),
                                    ),
                                    Text(
                                      "${foodData.quantity.value}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 0.025.toresponsive(context),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 0.025.toresponsive(context),
                                      ),
                                      onPressed: () =>
                                          cartController.increment(foodData),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
