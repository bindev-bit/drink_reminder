import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_reminder/component/custom_button_card.dart';
import 'package:water_reminder/component/function.dart';
import 'package:water_reminder/helper/drink_controller.dart';

class ActionProgress extends StatelessWidget with CustomFunction {
  String time;
  double height;
  VoidCallback onPressed;
  ActionProgress(this.time, {this.height, this.onPressed});

  var listIconCard = [
    {'image': 'assets/cup_1.png', 'ml': '250'},
    {'image': 'assets/cup_2.png', 'ml': '500'},
    {'image': 'assets/cup_3.png', 'ml': '1000'},
  ];

  DrinkController drinkController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: listIconCard
                .asMap()
                .entries
                .map(
                  (e) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () => drinkController.tapCardId(e.key),
                        child: ButtonCard(
                          e.value,
                          mid: height > .6,
                          onTap: drinkController.cardId.value != null
                              ? e.key == drinkController.cardId.value
                              : false,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(
            height: 20,
          ),
          Tooltip(
            message: 'Add Water',
            child: ElevatedButton(
              onPressed: onPressed,
              child: height > .9
                  ? Icon(
                      Icons.thumb_up,
                      size: 35,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.add,
                      size: 35,
                    ),
              style: ButtonStyle(
                shape: MaterialStateProperty.resolveWith<CircleBorder>(
                  (state) => CircleBorder(),
                ),
                padding: MaterialStateProperty.resolveWith<EdgeInsets>(
                  (states) => EdgeInsets.all(10),
                ),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.disabled))
                      return Colors.red.shade900;
                    return Colors.red; // Use the component's default.
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  today(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  time.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
