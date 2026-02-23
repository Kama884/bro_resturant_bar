import 'dart:convert';
import 'dart:developer';

import 'package:bro_resturant_bar/app/modules/profile/models/personal_information_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();
  var selectedGender = "Male".obs;

  final personalInformationData = <PersonalInformationModel>[].obs;
  final isLoading = true.obs;

  fetchPersonalInformation() async {
    isLoading(true);
    try {
      personalInformationData.value = await _fetchPersonalInformation();
    } catch (e) {
      log('Error $e');
    } finally {
      isLoading(false);
    }
  }

  Future<List<PersonalInformationModel>> _fetchPersonalInformation() async {
    try {
      final response = await http.get(
        Uri.parse('https://6994127dfade7a9ec0f432e5.mockapi.io/user'),
      );

      if (response.statusCode == 200) {
        //  return PersonalInformationModelFromJson(
        //   utf8.decode(response.bodyBytes),
        //  );
      } else {
        log('Somethings went wrong ${response.statusCode}');
      }
      return [];
    } catch (e) {
      log('Error $e');
      return [];
    }
  }

  Future<void> sendPersonalInformation({
    required String fullName,
    required String phoneNumber,
    required String dob,
    required String email,
    required String startDate,
    required String position,
    required String address,
  }) async {
    try {
      isLoading.value = true;
      final response = await http.post(
        Uri.parse("https://6994127dfade7a9ec0f432e5.mockapi.io/user"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "fullName": fullName,
          "phoneNumber": phoneNumber,
          "dob": dob,
          "email": email,
          "startDate": startDate,
          "position": position,
          "address": address,
          "gender": selectedGender.value,
        }),
      );
      if (response.statusCode == 200) {
        final user = PersonalInformationModel.fromJson(
          json.decode(response.body),
        );
        personalInformationData.refresh();
      } else {
        log("Somethings is wrong ${response.statusCode}");
      }
    } catch (e) {
      log("Error $e");
    }
  }
}
