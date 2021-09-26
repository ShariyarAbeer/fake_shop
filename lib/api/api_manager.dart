import 'dart:convert';

import 'package:fake_shop/links/links.dart';
import 'package:fake_shop/model/electronicsModel.dart';
import 'package:fake_shop/model/jeweleryModel.dart';
import 'package:fake_shop/model/menModel.dart';
import 'package:fake_shop/model/womenModel.dart';
import 'package:http/http.dart' as http;

class APIManager {
  var client = http.Client();
  Future<List<dynamic>?>? getCategories() async {
    List<dynamic>? categories;
    try {
      var response = await client.get(Uri.parse(Links().categoriesURL));
      if (response.statusCode == 200) {
        List<dynamic>? mapjas = json.decode(response.body);
        // print(mapjas.runtimeType);
        categories = mapjas!.map((e) => e).toList();
        // categories = mapjas!.map((e) => List<String>.fromJson(e)).toList();
        // print(categories);
      }
    } catch (e) {}
    // categories = List<String>.fromJson(jsonDecode(response.body));
    return categories;
  }

  Future<List<JeweleryModel>?> getJewelery() async {
    List<JeweleryModel>? jeweler;
    List<dynamic>? jsonMap;
    try {
      var response = await client.get(Uri.parse(Links().jeweleryURL));

      if (response.statusCode == 200) {
        jsonMap = json.decode(response.body);
        print(jsonMap);

        jeweler = jsonMap!.map((e) => JeweleryModel.fromJson(e)).toList();
        // print(jeweler);
      } else {
        print("object");
      }
    } catch (e) {}
    return jeweler;
  }

  Future<List<MenModel>?> getMenClothing() async {
    List<MenModel>? menClothing;
    List<dynamic>? jsonMap;
    try {
      var response = await client.get(Uri.parse(Links().menURL));

      if (response.statusCode == 200) {
        jsonMap = json.decode(response.body);
        // print(jsonMap);

        menClothing = jsonMap!.map((e) => MenModel.fromJson(e)).toList();
        // print(jeweler);
      } else {
        print("object");
      }
    } catch (e) {}
    return menClothing;
  }

  Future<List<WomenModel>?> getWomenClothing() async {
    List<WomenModel>? womenModel;
    List<dynamic>? jsonMap;
    try {
      var response = await client.get(Uri.parse(Links().womenURL));

      if (response.statusCode == 200) {
        jsonMap = json.decode(response.body);
        // print(jsonMap);

        womenModel = jsonMap!.map((e) => WomenModel.fromJson(e)).toList();
        // print(jeweler);
      } else {
        print("object");
      }
    } catch (e) {}
    return womenModel;
  }

  Future<List<ElectronicsModel>?> getElectronics() async {
    List<ElectronicsModel>? electronicsModel;
    List<dynamic>? jsonMap;
    try {
      var response = await client.get(Uri.parse(Links().electronicsURL));
      // print(response.statusCode == 200);
      if (response.statusCode == 200) {
        jsonMap = json.decode(response.body);
        // print(jsonMap);

        electronicsModel =
            jsonMap!.map((e) => ElectronicsModel.fromJson(e)).toList();
        // print(electronicsModel);
      } else {
        print("object");
      }
    } catch (e) {}
    return electronicsModel;
  }
}

void main() {
  APIManager().getElectronics();
}
