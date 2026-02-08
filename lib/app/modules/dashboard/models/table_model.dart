// To parse this JSON data, do
//
//     final tablemodel = tablemodelFromJson(jsonString);

import 'dart:convert';

List<Tablemodel> tablemodelFromJson(String str) =>
    List<Tablemodel>.from(json.decode(str).map((x) => Tablemodel.fromJson(x)));

String tablemodelToJson(List<Tablemodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tablemodel {
  String categoryId;
  String category;
  List<Table> table;

  Tablemodel({
    required this.categoryId,
    required this.category,
    required this.table,
  });

  factory Tablemodel.fromJson(Map<String, dynamic> json) => Tablemodel(
    categoryId: (json["categoryId"] ?? "").toString(),
    category: (json["category"] ?? "").toString(),
    table: List<Table>.from(json["table"].map((x) => Table.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "table": List<dynamic>.from(table.map((x) => x.toJson())),
  };
}

class Table {
  String id;
  String tableNumber;
  String capacity;
  String noOfGuests;
  String name;
  String number;
  String customerID;
  Status status;

  Table({
    required this.id,
    required this.tableNumber,
    required this.capacity,
    required this.noOfGuests,
    required this.name,
    required this.number,
    required this.customerID,
    required this.status,
  });

  factory Table.fromJson(Map<String, dynamic> json) => Table(
    id: json["id"],
    tableNumber: json["tableNumber"],
    capacity: json["capacity"],
    noOfGuests: json["noOfGuests"],
    name: json["name"],
    number: json["number"],
    customerID: json["customerID"],
    status: statusValues.map[json["status"]]!,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tableNumber": tableNumber,
    "capacity": capacity,
    "noOfGuests": noOfGuests,
    "name": name,
    "number": number,
    "customerID": customerID,
    "status": statusValues.reverse[status],
  };
}

enum Status { AVAILABLE, RESERVED }

final statusValues = EnumValues({
  "available": Status.AVAILABLE,
  "reserved": Status.RESERVED,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
