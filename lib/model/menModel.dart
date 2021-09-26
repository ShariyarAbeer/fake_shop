// To parse this JSON data, do
//
//     final menModel = menModelFromJson(jsonString);

import 'dart:convert';

List<MenModel> menModelFromJson(String str) =>
    List<MenModel>.from(json.decode(str).map((x) => MenModel.fromJson(x)));

String menModelToJson(List<MenModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MenModel {
  MenModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  factory MenModel.fromJson(Map<String, dynamic> json) => MenModel(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        price: json["price"] == null ? null : json["price"].toDouble(),
        description: json["description"] == null ? null : json["description"],
        category: json["category"] == null ? null : json["category"],
        image: json["image"] == null ? null : json["image"],
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "price": price == null ? null : price,
        "description": description == null ? null : description,
        "category": category == null ? null : category,
        "image": image == null ? null : image,
        "rating": rating == null ? null : rating!.toJson(),
      };
}

class Rating {
  Rating({
    this.rate,
    this.count,
  });

  double? rate;
  dynamic? count;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"] == null ? null : json["rate"].toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate == null ? null : rate,
        "count": count,
      };
}
