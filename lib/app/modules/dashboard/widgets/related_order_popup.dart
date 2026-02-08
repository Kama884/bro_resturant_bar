import 'package:bro_resturant_bar/app/routes/app_routes.dart';
import 'package:bro_resturant_bar/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class RelatedOrderPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: 0.035.w(context),
          vertical: 0.020.h(context),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          //  borderRadius: BorderRadius.all(0.030.toresponsive(context)),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0.030.toresponsive(context)),
            topRight: Radius.circular(0.030.toresponsive(context)),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Choose Related Order",
                    style: TextStyle(
                      fontSize: 0.025.toresponsive(context),
                      color: Colors.blue[900],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(Icons.cancel, color: Colors.redAccent),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 0.030.h(context)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCategoryItem(Icons.restaurant, 'Meals', () {
                    Get.toNamed(Routes.FOOD_SCREEN);
                    print("Meals selected");
                  }),
                  _buildCategoryItem(Icons.local_bar, 'Beverages', () {
                    print("Beverages selected");
                  }),
                ],
              ),
              SizedBox(height: 0.020.h(context)),

              _buildCategoryItem(Icons.cake, 'Dessert', () {
                print("Dessert selected");
              }),
              SizedBox(height: 0.030.h(context)),
            ],
          ),
        ),
      ),
    );
  }

  _buildCategoryItem(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue[900]),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
