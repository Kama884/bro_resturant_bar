import 'dart:developer';

import 'package:bro_resturant_bar/app/modules/ordering/models/ordered_food_model.dart';
import 'package:bro_resturant_bar/utils/responsive.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final OrderFoodmodel orderData;
  final int index;
  final VoidCallback onAdd;
  final VoidCallback onCancel;

  const OrderCard({
    super.key,
    required this.orderData,
    required this.index,
    required this.onCancel,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 0.015.toresponsive(context),
        vertical: 0.02.toresponsive(context),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blue[900]!),
        borderRadius: BorderRadius.circular(0.015.toresponsive(context)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0.013.toresponsive(context)),
        child: Column(
          children: [
            _buildHeader(context),
            _buildItemList(),
            Divider(height: 4, color: Colors.blue[900]),
            _buildActionButton(),
          ],
        ),
      ),
    );
  }

  _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0.012.toresponsive(context)),
      decoration: BoxDecoration(
        color: Colors.blue[900],
        //borderRadius: BorderRadius.circular(0.012.toresponsive(context)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Table ${orderData.tableNumber} | ${orderData.itemCount} items',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),

          Text(
            'Order ${orderData.orderId} | ${orderData.timeAgo}',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  _buildItemList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: orderData.items.length,
      itemBuilder: (context, index) {
        final item = orderData.items[index];
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.012.toresponsive(context),
            vertical: 0.012.toresponsive(context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '${item.quantity}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(width: 0.012.w(context)),

                  Expanded(child: Text('${item.itemName}')),

                  Text('Rs ${item.price}'),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  _buildActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton.icon(
          onPressed: () {
            log('canceled');
          },
          icon: Icon(Icons.cancel, color: Colors.red[600]),
          label: Text(
            'Cancel Order',
            style: TextStyle(
              color: Colors.red[600],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        TextButton.icon(
          onPressed: () {
            log('Item Added');
          },

          label: Text(
            'Add Order',
            style: TextStyle(
              color: Colors.blue[900],
              fontWeight: FontWeight.bold,
            ),
          ),
          icon: Icon(Icons.add_circle_outlined, color: Colors.blue[900]),
        ),
      ],
    );
  }
}
