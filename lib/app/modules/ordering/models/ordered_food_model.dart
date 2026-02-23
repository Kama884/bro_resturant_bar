import 'dart:convert';

List<OrderFoodmodel> orderFoodmodelFromJson(String str) =>
    List<OrderFoodmodel>.from(
      json.decode(str).map((x) => OrderFoodmodel.fromJson(x)),
    );

String orderFoodmodelToJson(List<OrderFoodmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderFoodmodel {
  String orderId;
  String tableNumber;
  int itemCount;
  String timeAgo;
  List<Item> items;

  OrderFoodmodel({
    required this.orderId,
    required this.tableNumber,
    required this.itemCount,
    required this.timeAgo,
    required this.items,
  });

  factory OrderFoodmodel.fromJson(Map<String, dynamic> json) => OrderFoodmodel(
    orderId: json["OrderId"],
    tableNumber: json["TableNumber"],
    itemCount: json["ItemCount"],
    timeAgo: json["TimeAgo"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "OrderId": orderId,
    "TableNumber": tableNumber,
    "ItemCount": itemCount,
    "TimeAgo": timeAgo,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  int quantity;
  String itemName;
  int price;

  Item({required this.quantity, required this.itemName, required this.price});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    quantity: json["quantity"],
    itemName: json["itemName"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "quantity": quantity,
    "itemName": itemName,
    "price": price,
  };
}
