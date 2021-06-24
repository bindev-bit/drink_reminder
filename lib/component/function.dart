import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

mixin CustomFunction {
  int countPercentage(Animation<double> height) =>
      ((height.value - .2) / .75 * 100).toInt();

  int countMl(Animation<double> height) =>
      ((height.value - .2) / .75 * 2000).toInt();

  String formatTime(DateTime now) {
    return DateFormat('h:mm a').format(now);
  }

  String today() {
    DateTime now = DateTime.now();
    var format = DateFormat('EEEE, MMM d, yyyy').format(now);
    return format.toString();
  }

  drinkWater(int ml) {
    var heightMl = 0.0;
    heightMl = ml / 2000;

    return heightMl * .75;
  }
}
