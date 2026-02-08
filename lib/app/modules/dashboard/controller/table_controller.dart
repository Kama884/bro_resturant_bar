import 'dart:convert';
import 'dart:developer';

import 'package:bro_resturant_bar/app/modules/dashboard/models/table_model.dart';
import 'package:bro_resturant_bar/app/modules/dashboard/models/table_model.dart'
    as model;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class TableController extends GetxController {
  static TableController get instance => Get.find();

  final tableData = <Tablemodel>[].obs;
  var isLoading = true.obs;

  var selectedCategory = "All".obs;

  @override
  void onInit() {
    super.onInit();
    log("fetch is started");
    fetchTables();
  }

  fetchTables() async {
    isLoading(true);
    try {
      tableData.value = await _fetchFromApi();
      log('TableData ${tableData.length}');
    } catch (e) {
      log("Error: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<List<Tablemodel>> _fetchFromApi() async {
    try {
      final response = await http.get(
        Uri.parse('https://69648e56e8ce952ce1f20e23.mockapi.io/student'),
      );

      // log("response ${response.body}");

      if (response.statusCode == 200) {
        return tablemodelFromJson(utf8.decode(response.bodyBytes));
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

  List<Tablemodel> get filteredTableData {
    if (selectedCategory.value == "All") {
      return tableData; // Show all data
    } else {
      //If category is match then only it will filter
      return tableData
          .where((cat) => cat.category == selectedCategory.value)
          .toList();
    }
  }

  // functon that change category
  void changeCategory(String categoryName) {
    selectedCategory.value = categoryName;
  }

  // Future<void> makeReservation({
  //   required String tableNumber,
  //   required String name,
  //   required String number,
  //   required String customerId,
  //   required String noOfGuests,
  //   required int categoryIndex,
  // }) async {
  //   try {
  //     Tablemodel targetCategory = tableData[categoryIndex];

  //     for (var t in targetCategory.table) {
  //       if (t.id == tableNumber) {
  //         t.status = Status.RESERVED;
  //         t.name = name;
  //         t.number = number;
  //         t.customerId = customerId;
  //         t.noOfGuests = noOfGuests;
  //
  //       }
  //     }

  //     final response = await http.put(
  //       Uri.parse(
  //         'https://69648e56e8ce952ce1f20e23.mockapi.io/students/${categoryIndex + 1}',
  //       ),

  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode(bodyData),
  //     );

  //     if (response.statusCode == 200) {
  //       final updatedCategory = Tablemodel.fromJson(json.decode(response.body));
  //       tableData[categoryIndex] = updatedCategory;
  //       tableData.refresh();

  //       log("Table reserved successfully");
  //     } else {
  //       log("Failed to reserve table. Code: ${response.statusCode}");
  //       log("Message: ${response.body}");
  //     }
  //   } catch (e) {
  //     log("Update error: $e");
  //   }
  // }

  Future<void> makeReservation({
    required String id,
    // required Status status,
    required String name,
    required String number,
    required String customerID,
    required String noOfGuests,
  }) async {
    try {
      final body = {
        "table_id": id,
        "name": name,
        "number": number,
        "no_of_guest": noOfGuests,
        "customer_id": customerID,
        //"status": "true",
        "status": true,
      };

      final response = await http.put(
        Uri.parse('https://69648e56e8ce952ce1f20e23.mockapi.io/students'),

        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      log("log $body");
      bool found = false;
      for (var category in tableData) {
        int tableIndex = category.table.indexWhere((t) => t.id == id);

        if (tableIndex != -1) {
          category.table[tableIndex].status = model.Status.RESERVED;

          category.table[tableIndex].name = name;

          found = true;
          break;
        }
      }

      if (found) {
        tableData.refresh();
        update();
        Get.back();
      }

      if (response.statusCode == 200) {
      } else {
        log("Failed to reserve table. Code: ${response.statusCode}");
      }
    } catch (e) {
      log("Update error: $e");
    }
  }
}
