// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'dart:convert';

List<Item> itemFromJson(String str) => List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemToJson(List<Item> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
    String model;
    int pk;
    Fields fields;

    Item({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
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
    String name;
    int price;
    String description;
    DateTime productReleaseDate;
    int amount;

    Fields({
        required this.user,
        required this.name,
        required this.price,
        required this.description,
        required this.productReleaseDate,
        required this.amount,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        productReleaseDate: DateTime.parse(json["product_release_date"]),
        amount: json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "price": price,
        "description": description,
        "product_release_date": "${productReleaseDate.year.toString().padLeft(4, '0')}-${productReleaseDate.month.toString().padLeft(2, '0')}-${productReleaseDate.day.toString().padLeft(2, '0')}",
        "amount": amount,
    };
}
