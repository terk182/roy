// To parse this JSON data, do
//
//     final allmodel = allmodelFromJson(jsonString);

import 'dart:convert';

Allmodel allmodelFromJson(String str) => Allmodel.fromJson(json.decode(str));

String allmodelToJson(Allmodel data) => json.encode(data.toJson());

class Allmodel {
  Allmodel({
    required this.success,
    required this.shop,
    required this.promotion,
  });

  int success;
  List<Shop> shop;
  List<Promotion> promotion;

  factory Allmodel.fromJson(Map<String, dynamic> json) => Allmodel(
        success: json["success"],
        shop: List<Shop>.from(json["shop"].map((x) => Shop.fromJson(x))),
        promotion: List<Promotion>.from(
            json["promotion"].map((x) => Promotion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "shop": List<dynamic>.from(shop.map((x) => x.toJson())),
        "promotion": List<dynamic>.from(promotion.map((x) => x.toJson())),
      };
}

class Promotion {
  Promotion({
    required this.name,
    required this.image,
    required this.store,
    required this.deliveryTime,
    required this.storeType,
  });

  String name;
  String image;
  String store;
  String deliveryTime;
  String storeType;

  factory Promotion.fromJson(Map<String, dynamic> json) => Promotion(
        name: json["name"],
        image: json["image"],
        store: json["store"],
        deliveryTime: json["delivery_time"],
        storeType: json["store_type"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "store": store,
        "delivery_time": deliveryTime,
        "store_type": storeType,
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
