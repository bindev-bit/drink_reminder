import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_reminder/component/chart_card.dart';
import 'package:water_reminder/component/const.dart';
import 'package:water_reminder/component/custom_navbar.dart';
import 'package:water_reminder/helper/drink_controller.dart';
import 'package:water_reminder/helper/model/drink_model.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  DrinkController drinkController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomNavbar(),
          recentDrink(),
        ],
      ),
    );
  }

  Widget recentDrink() {
    return StreamBuilder<List<LogDrinkModel>>(
      stream: Stream.fromFuture(drinkController.fetchTotalDrink()),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return LinearProgressIndicator();
        else {
          return Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ChartCard(snapshot.data),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    "Recent Drink",
                    style: TextStyle(
                      color: secondary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                expansionTile(snapshot),
              ],
            ),
          );
        }
      },
    );
  }

  Widget expansionTile(AsyncSnapshot<List<LogDrinkModel>> snapshot) {
    return Expanded(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: snapshot.data
              .map(
                (e) => StreamBuilder<DrinkDailyModel>(
                  stream: Stream.fromFuture(drinkController.drinkDaily(e.date)),
                  builder: (context, drink) {
                    if (!drink.hasData)
                      return Container();
                    else {
                      return ExpansionTile(
                        title: Text(
                          e.date,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondary,
                          ),
                        ),
                        backgroundColor: secondary.withOpacity(.1),
                        leading: Icon(Icons.date_range),
                        trailing: Text(
                          e.ml + ' ml',
                        ),
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: drink.data.listDrink
                                  .map(
                                    (listDrink) => ListTile(
                                      title: Text(listDrink.time),
                                      leading: Icon(Icons.access_time),
                                      trailing: Text(
                                        "+ " + listDrink.ml + " ml",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          )
                        ],
                      );
                    }
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
