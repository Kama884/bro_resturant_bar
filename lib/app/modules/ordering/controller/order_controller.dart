import 'dart:convert';
import 'dart:developer';

import 'package:bro_resturant_bar/app/modules/ordering/models/ordered_food_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final orderData = <OrderFoodmodel>[].obs;
  final isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    log('fetched is started');
    fetchOrderFood();
  }

  fetchOrderFood() async {
    isLoading(true);
    try {
      orderData.value = await _fetchOrderFood();
      log('orderData ${orderData.length}');
    } catch (e) {
      log('Error: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<List<OrderFoodmodel>> _fetchOrderFood() async {
    try {
      final response = await http.get(
        Uri.parse('https://6994127dfade7a9ec0f432e5.mockapi.io/Ordered_food'),
      );

      if (response.statusCode == 200) {
        return orderFoodmodelFromJson(utf8.decode(response.bodyBytes));
      } else {
        log('Somethings went Wrong ${response.statusCode}');
      }
      return [];
    } catch (e) {
      log('Error: $e');
      return [];
    }
  }
}
