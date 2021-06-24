import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:water_reminder/component/const.dart';

class LiquidProgressComponent extends StatelessWidget {
  double height;
  LiquidProgressComponent(this.height);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: SizedBox(
        height: Get.height / 1.8,
        child: LiquidLinearProgressIndicator(
          value: height,
          valueColor: AlwaysStoppedAnimation(secondary),
          backgroundColor: Colors.white,
          borderColor: Colors.white,
          borderWidth: -1.0,
          borderRadius: 0.0,
          direction: Axis.vertical,
        ),
      ),
    );
  }
}
