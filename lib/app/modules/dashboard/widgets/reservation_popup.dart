import 'dart:developer';

import 'package:bro_resturant_bar/app/modules/dashboard/controller/reservation_controller.dart';
import 'package:bro_resturant_bar/app/modules/dashboard/controller/table_controller.dart';
import 'package:bro_resturant_bar/app/modules/dashboard/models/table_model.dart'
    as model;
import 'package:bro_resturant_bar/app/modules/dashboard/widgets/related_order_popup.dart';
import 'package:bro_resturant_bar/utils/responsive.dart';
import 'package:bro_resturant_bar/widgets/custom_textfield.dart';
import 'package:bro_resturant_bar/widgets/cutom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservationPopup extends StatelessWidget {
  RxInt GuestCount = 1.obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController customernoController = TextEditingController();

  final int categoryIndex;
  final model.Table tableData;
  ReservationPopup({
    super.key,
    required this.tableData,
    required this.categoryIndex,
  });
  @override
  Widget build(BuildContext context) {
    final reservationController = Get.put(ReservationController());
    final tableController = Get.put(TableController());
    return Padding(
      padding: EdgeInsets.all(MediaQuery.viewInsetsOf(context).bottom),
      child: Container(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: 0.035.w(context),
          vertical: 0.015.h(context),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(Icons.cancel, color: Colors.redAccent),
                ),
              ),
              Text(
                'Table :  ${tableData.tableNumber}',
                style: TextStyle(
                  fontSize: 0.034.toresponsive(context),
                  //fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 0.015.h(context)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'No of Guests:',
                    style: TextStyle(fontSize: 0.034.toresponsive(context)),
                  ),
                  //SizedBox(width: 0.020.w(context)),
                  Row(
                    children: [
                      Obx(
                        () => Text(
                          '${reservationController.GuestCount.value}',
                          style: TextStyle(
                            fontSize: 0.034.toresponsive(context),
                          ),
                        ),
                      ),
                      SizedBox(width: 0.060.w(context)),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 218, 216, 216),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color.fromARGB(255, 75, 75, 75),
                          ),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () =>
                                  reservationController.decrement(),
                              icon: Icon(Icons.remove),
                            ),

                            IconButton(
                              onPressed: () =>
                                  reservationController.increment(),
                              icon: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              //SizedBox(height: 0.010.h(context)),
              Divider(
                color: Colors.grey,
                thickness: 1.5,
                height: 0.030.h(context),
              ),

              Text(
                'Guest Personal Info',
                style: TextStyle(
                  fontSize: 0.034.toresponsive(context),
                  //fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 0.020.h(context)),

              CustomTextfield(controller: nameController, hintText: 'Name'),

              SizedBox(height: 0.010.h(context)),

              CustomTextfield(controller: numberController, hintText: 'Number'),

              SizedBox(height: 0.010.h(context)),

              CustomTextfield(
                controller: customernoController,
                hintText: 'Customer ID',
              ),

              SizedBox(height: 0.030.h(context)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 0.4.w(context),
                    child: CustomButton(
                      btnName: 'Reserve',
                      callback: () async {
                        await tableController.makeReservation(
                          id: tableData.id,
                          // status: tableData.status,
                          name: nameController.text,
                          number: numberController.text,
                          customerID: customernoController.text,
                          noOfGuests: reservationController.GuestCount.value
                              .toString(),
                        );

                        //Get.back();

                        log('API call complete');
                      },
                    ),
                  ),

                  SizedBox(
                    width: 0.4.w(context),
                    child: CustomButton(
                      btnName: 'Start',
                      callback: () {
                        Get.back();
                        // Get.bottomSheet(RelatedOrderPopup());
                        Get.dialog(
                          Center(
                            child: RelatedOrderPopup(),
                          ), // Wrap in Center to force middle alignment
                          barrierDismissible: true,
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.025.h(context)),
            ],
          ),
        ),
      ),
    );
  }
}
