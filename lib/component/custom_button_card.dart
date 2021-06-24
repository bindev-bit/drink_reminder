import 'package:flutter/material.dart';
import 'package:water_reminder/component/const.dart';

class ButtonCard extends StatelessWidget {
  Map<String, String> asset;
  bool mid = false;
  bool onTap = false;
  ButtonCard(this.asset, {this.mid, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: onTap ? null : Border.all(color: secondary),
        color: onTap ? secondary : Colors.white,
        boxShadow: onTap
            ? [
                BoxShadow(
                  color: mid
                      ? Colors.white.withOpacity(.5)
                      : secondary.withOpacity(.3),
                  blurRadius: 20,
                  offset: Offset(0, 0),
                )
              ]
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            asset['image'],
            scale: 5,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "+ ${asset['ml']} ml",
            style: TextStyle(
              fontSize: 16,
              color: onTap ? Colors.greenAccent : Colors.green[800],
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
