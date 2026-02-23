import 'package:bro_resturant_bar/app/modules/dashboard/controller/navigation_controller.dart';
import 'package:bro_resturant_bar/app/routes/app_routes.dart';
import 'package:bro_resturant_bar/utils/responsive.dart';
import 'package:bro_resturant_bar/widgets/cutom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class confirmOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(0.04.toresponsive(context)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 0.010.h(context)),
              Image.asset(
                'assets/images/confirm_picture.png',
                fit: BoxFit.cover,
              ),
              //SizedBox(height: 0.005.h(context)),
              Text(
                'CONGRATULATIONS!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 5),

              Text(
                'YOUR ORDER HAS BEEN PLACE SUCCESSFULLY',
                style: TextStyle(
                  fontSize: 16,
                  //fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),

              Text(
                'YOUR ORDER ID:',
                style: TextStyle(
                  fontSize: 32,
                  //fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 0.050.h(context)),

              CustomButton(btnName: 'Done', callback: () {}),

              // ElevatedButton(
              //   onPressed: () {
              //     // log(' Done ');
              //   },
              //   child: Text(
              //     'Done',
              //     style: TextStyle(
              //       fontSize: 0.026.toresponsive(context),
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.blue[900],
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(
              //         0.08.toresponsive(context),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(height: 0.030.h(context)),

              CustomButton(
                btnName: 'View Order Details',
                callback: () {
                  final navigationController = Get.find<NavigationController>();
                  navigationController.changeIndex(1);
                  Get.offNamed(Routes.MAIN_WRAPPER);
                },
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     final navigationController = Get.find<NavigationController>();
              //     navigationController.changeIndex(1);
              //     Get.offNamed(Routes.MAIN_WRAPPER);
              //   },
              //   child: Text(
              //     'View Order Details',
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 0.026.toresponsive(context),
              //     ),
              //   ),
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.blue[900],
              //     foregroundColor: Colors.white,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(
              //         0.08.toresponsive(context),
              //       ),
              //     ),
              //     padding: EdgeInsets.symmetric(
              //       horizontal: 0.050.toresponsive(context),
              //       vertical: 0.020.toresponsive(context),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
