import 'dart:convert';

import 'package:bro_resturant_bar/app/modules/ordering/models/food_model.dart';
import 'package:get/get.dart';
import 'dart:developer';

import 'package:http/http.dart' as http;

class FoodController extends GetxController {
  static FoodController get instance => Get.find();

  final foodData = <Foodmodel>[].obs;
  final isLoading = true.obs;

  final selectedCategory = 'All'.obs;

  @override
  void onInit() {
    super.onInit();
    log("fetch is started");
    fetchFood();
  }

  fetchFood() async {
    isLoading(true);
    try {
      foodData.value = await _fetchFoodFromApi();
      log('FoodData ${foodData.length}');
    } catch (e) {
      log("Error: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<List<Foodmodel>> _fetchFoodFromApi() async {
    try {
      final response = await http.get(
        Uri.parse("https://69648e56e8ce952ce1f20e23.mockapi.io/food"),
      );
      log("response ${response.body}");

      if (response.statusCode == 200) {
        return foodmodelFromJson(utf8.decode(response.bodyBytes));
      } else if (response.statusCode == 404) {
        log("404 error");
      } else if (response.statusCode == 500) {
        log('server error');
      } else {
        log('Something is error');
      }
      return [];
    } catch (e) {
      log('error $e');
      return [];
    }
  }

  List<Foodmodel> get filteredFoodData {
    if (selectedCategory.value == "All") {
      return foodData; // Show all data
    } else {
      //If category is match then only it will filter
      return foodData
          .where((cat) => cat.category == selectedCategory.value)
          .toList();
    }
  }

  void changeCategory(String categoryName) {
    selectedCategory.value = categoryName;
  }
}
