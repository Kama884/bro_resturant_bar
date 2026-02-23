import 'package:bro_resturant_bar/app/modules/dashboard/controller/table_controller.dart';
import 'package:bro_resturant_bar/app/modules/dashboard/models/table_model.dart'
    as model;
import 'package:bro_resturant_bar/app/modules/dashboard/widgets/reservation_popup.dart';
import 'package:bro_resturant_bar/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TableCard extends StatelessWidget {
  final model.Table tableData;
  final int index;

  const TableCard({super.key, required this.tableData, required this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TableController>(
      builder: (controller) {
        bool isReserved = tableData.status == model.Status.RESERVED;

        return InkWell(
          onTap: () {
            Get.bottomSheet(
              ReservationPopup(tableData: tableData, categoryIndex: index),
              // isScrollControlled: true,
            );
          },
          child: Card(
            elevation: 0,
            color: isReserved ? Colors.pink[200] : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.grey.shade500, width: 1),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FittedBox(
                      child: Text(
                        tableData.tableNumber,
                        style: TextStyle(
                          fontSize: 0.035.toresponsive(context),
                          fontWeight: FontWeight.w900,
                          color: Colors.blue[900],
                        ),
                      ),
                    ),

                    SizedBox(height: 8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.people, size: 14, color: Colors.blue[900]),

                        SizedBox(width: 4),

                        Flexible(
                          child: Text(
                            "${tableData.capacity}",

                            style: TextStyle(fontSize: 11, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
