// To parse this JSON data, do
//
//     final maindata = maindataFromJson(jsonString);

import 'dart:convert';

Maindata maindataFromJson(String str) => Maindata.fromJson(json.decode(str));

String maindataToJson(Maindata data) => json.encode(data.toJson());

class Maindata {
  Maindata({
    required this.success,
    required this.shop,
  });

  int success;
  List<Shop> shop;

  factory Maindata.fromJson(Map<String, dynamic> json) => Maindata(
        success: json["success"],
        shop: List<Shop>.from(json["shop"].map((x) => Shop.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "shop": List<dynamic>.from(shop.map((x) => x.toJson())),
      };
}

class Shop {
  Shop({
    required this.name,
    required this.image,
    required this.isOpen,
    required this.tags,
    required this.deliveryTime,
    required this.storeType,
  });

  String name;
  String image;
  bool isOpen;
  String tags;
  String deliveryTime;
  String storeType;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        name: json["name"],
        image: json["image"],
        isOpen: json["is_open"],
        tags: json["tags"],
        deliveryTime: json["delivery_time"],
        storeType: json["store_type"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "is_open": isOpen,
        "tags": tags,
        "delivery_time": deliveryTime,
        "store_type": storeType,
      };
}
