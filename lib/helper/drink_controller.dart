import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:water_reminder/helper/model/drink_model.dart';

class DrinkController extends GetxController {
  String url = "http://192.168.100.7/udacoding/5.3/";

  RxInt cardId = 0.obs;

  void tapCardId(int id) {
    cardId.value = id;
  }

  Future<DrinkDailyModel> drinkDaily(String date) async {
    var resp = await http.post(
      Uri.parse(url + "drink.php"),
      body: {
        "date": date,
      },
    );

    if (resp.statusCode == 200) {
      Map data = jsonDecode(resp.body);
      DrinkDailyModel model = DrinkDailyModel.fromJson(data);
      return model;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<LogDrink> totalDrinkToday() async {
    DateTime now = DateTime.now();
    var today = DateFormat('y-MM-d').format(now);
    var resp = await http.get(
      Uri.parse(url + "drink.php?date=$today"),
    );
    if (resp.statusCode == 200) {
      Map data = jsonDecode(resp.body);
      LogDrink model = LogDrink.fromJson(data);
      return model;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<LogDrinkModel>> fetchTotalDrink() async {
    var resp = await http.get(
      Uri.parse(url + "log_drink.php"),
    );

    if (resp.statusCode == 200) {
      List data = jsonDecode(resp.body);
      return data.map((e) => LogDrinkModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> addDrink(int ml) async {
    await http
        .post(Uri.parse(url + "log_drink.php"), body: {"ml": ml.toString()});
  }

  void deleteDrink(int id) {}
}
