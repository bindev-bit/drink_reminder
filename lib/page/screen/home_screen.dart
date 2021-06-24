import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_reminder/component/function.dart';
import 'package:water_reminder/helper/drink_controller.dart';
import 'package:water_reminder/helper/model/drink_model.dart';
import 'package:water_reminder/page/screen/home_component/action_progress_component.dart';
import 'package:water_reminder/page/screen/home_component/header_component.dart';
import 'package:water_reminder/page/screen/home_component/liquid_progress_component.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin, CustomFunction {
  DrinkController drinkController = Get.put(DrinkController());
  AnimationController controller;
  Animation<double> height;
  String time;

  @override
  void initState() {
    time = formatTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => getTime());

    Future.delayed(Duration(milliseconds: 800), () async => await getMl());

    super.initState();
  }

  Future<void> getMl() async {
    var drink = await drinkController.totalDrinkToday();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    var mlBegin = drinkWater(int.parse(drink.drinkModel[0].ml));

    height = Tween<double>(begin: 0.0, end: mlBegin + .2).animate(controller);
    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<LogDrink>(
        stream: Stream.fromFuture(drinkController.totalDrinkToday()),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          else {
            return Stack(
              children: [
                LiquidProgressComponent(height.value),
                ActionProgress(
                  time,
                  height: height.value,
                  onPressed: cardPressed,
                ),
                HeaderHomeComponent(
                  animationHeight: height,
                  percentage: ((height.value - .2) / .75 * 100).toPrecision(1),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  VoidCallback cardPressed() {
    if (controller.status == AnimationStatus.completed || height.value < .9) {
      return () {
        switch (drinkController.cardId.value) {
          case 0:
            addWater(250);
            drinkController.addDrink(250);
            break;
          case 1:
            addWater(500);
            drinkController.addDrink(500);
            break;
          case 2:
            addWater(1000);
            drinkController.addDrink(1000);
            break;
        }
      };
    } else {
      return null;
    }
  }

  void addWater(int ml) {
    double heightBegin = height.value;
    double x = drinkWater(ml);

    controller.reset();
    height = Tween<double>(begin: heightBegin, end: heightBegin + x)
        .animate(controller);
    controller.forward();
  }

  void getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = formatTime(now);
    setState(() {
      time = formattedDateTime;
    });
  }
}
