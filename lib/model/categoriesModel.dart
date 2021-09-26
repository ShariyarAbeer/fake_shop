// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

List<dynamic> categoriesModelFromJson(String str) =>
    List<dynamic>.from(json.decode(str).map((x) => x));

String categoriesModelToJson(List<dynamic> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));
