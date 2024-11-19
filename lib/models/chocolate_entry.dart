// To parse this JSON data, do
//
//     final chocolateProduct = chocolateProductFromJson(jsonString);

import 'dart:convert';

List<ChocolateProduct> chocolateProductFromJson(String str) => List<ChocolateProduct>.from(json.decode(str).map((x) => ChocolateProduct.fromJson(x)));

String chocolateProductToJson(List<ChocolateProduct> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChocolateProduct {
    String model;
    String pk;
    Fields fields;

    ChocolateProduct({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory ChocolateProduct.fromJson(Map<String, dynamic> json) => ChocolateProduct(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String productName;
    int price;
    String description;
    String type;
    int cocoaRatio;

    Fields({
        required this.user,
        required this.productName,
        required this.price,
        required this.description,
        required this.type,
        required this.cocoaRatio,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        productName: json["product_name"],
        price: json["price"],
        description: json["description"],
        type: json["type"],
        cocoaRatio: json["cocoa_ratio"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "product_name": productName,
        "price": price,
        "description": description,
        "type": type,
        "cocoa_ratio": cocoaRatio,
    };
}
