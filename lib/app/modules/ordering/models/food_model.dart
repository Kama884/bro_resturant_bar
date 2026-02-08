// To parse this JSON data, do
//
//     final foodmodel = foodmodelFromJson(jsonString);

import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

List<Foodmodel> foodmodelFromJson(String str) =>
    List<Foodmodel>.from(json.decode(str).map((x) => Foodmodel.fromJson(x)));

String foodmodelToJson(List<Foodmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Foodmodel {
  String category;
  List<Food> food;

  Foodmodel({required this.category, required this.food});

  factory Foodmodel.fromJson(Map<String, dynamic> json) => Foodmodel(
    category: json["category"],
    food: List<Food>.from(json["food"].map((x) => Food.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "food": List<dynamic>.from(food.map((x) => x.toJson())),
  };
}

class Food {
  String id;
  String name;
  String price;
  String image;
  var quantity = 0.obs;

  Food({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "image": image,
  };
}
