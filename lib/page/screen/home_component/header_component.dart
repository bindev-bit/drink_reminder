import 'package:flutter/material.dart';
import 'package:water_reminder/component/custom_navbar.dart';
import 'package:water_reminder/component/custom_paint.dart';

import 'package:water_reminder/component/function.dart';

class HeaderHomeComponent extends StatelessWidget with CustomFunction {
  Animation<double> animationHeight;
  double percentage;
  HeaderHomeComponent({this.animationHeight, this.percentage});
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomNavbar(),
          SizedBox(
            height: 50,
          ),
          CustomPaint(
            foregroundPainter: CirclePaint(
              buttonBorderColor: Colors.grey[300],
              progressColor: Colors.red,
              percentage: percentage,
              width: 8.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(.5),
                    blurRadius: 20,
                    offset: Offset(0, 0),
                  )
                ],
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        "${countPercentage(animationHeight)}%",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "${countMl(animationHeight)} ml",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      Opacity(
                        opacity: .5,
                        child: Text(
                          "${countMl(animationHeight) - 2000} ml",
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
