class DrinkDailyModel {
  int value;
  String message;
  List<DrinkModel> listDrink;

  DrinkDailyModel({this.value, this.message, this.listDrink});

  factory DrinkDailyModel.fromJson(Map<String, dynamic> json) =>
      DrinkDailyModel(
        value: json['value'],
        message: json['message'],
        listDrink: List<DrinkModel>.from(
            json['data'].map((x) => DrinkModel.fromJson(x))),
      );
}

class DrinkModel {
  String id, ml, date, time;

  DrinkModel({this.id, this.ml, this.date, this.time});

  factory DrinkModel.fromJson(Map<String, dynamic> json) => DrinkModel(
        id: json['id'],
        ml: json['ml'],
        date: json['date'],
        time: json['time'],
      );
}

class LogDrink {
  List<LogDrinkModel> drinkModel;
  int value;
  String message;

  LogDrink({this.drinkModel, this.value, this.message});

  factory LogDrink.fromJson(Map<String, dynamic> json) => LogDrink(
        value: json['value'],
        message: json['message'],
        drinkModel: List<LogDrinkModel>.from(
            json['data'].map((x) => LogDrinkModel.fromJson(x))),
      );
}

class LogDrinkModel {
  String id, ml, date, lastUpdate;

  LogDrinkModel({this.id, this.ml, this.date, this.lastUpdate});

  factory LogDrinkModel.fromJson(Map<String, dynamic> json) => LogDrinkModel(
        id: json['id'],
        ml: json['ml'],
        date: json['date'],
        lastUpdate: json['last_update'],
      );
}
