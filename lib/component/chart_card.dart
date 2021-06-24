import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:water_reminder/component/const.dart';
import 'package:water_reminder/helper/model/drink_model.dart';

class ChartCard extends StatelessWidget {
  List<LogDrinkModel> snapshot;
  ChartCard(this.snapshot);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: SfCartesianChart(
        zoomPanBehavior: ZoomPanBehavior(
          enableDoubleTapZooming: true,
          enablePinching: true,
          zoomMode: ZoomMode.x,
          enablePanning: true,
        ),
        enableAxisAnimation: true,
        primaryXAxis: CategoryAxis(
          majorGridLines: MajorGridLines(width: 0),
          labelStyle: TextStyle(color: secondary),
          axisLine: AxisLine(color: secondary),
          majorTickLines: MajorTickLines(size: 3, color: secondary),
          labelPlacement: LabelPlacement.betweenTicks,
        ),
        primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 2500,
          axisLine: AxisLine(color: secondary),
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          labelFormat: '{value}',
          majorTickLines: MajorTickLines(
            size: 0,
            color: secondary,
          ),
        ),
        tooltipBehavior: TooltipBehavior(
          enable: true,
        ),
        series: <ColumnSeries<LogDrinkModel, String>>[
          ColumnSeries<LogDrinkModel, String>(
            dataSource: snapshot,
            xValueMapper: (LogDrinkModel log, _) => log.date,
            yValueMapper: (LogDrinkModel log, _) => int.parse(log.ml),
            name: 'ml',
            color: secondary,
          ),
        ],
      ),
    );
  }
}
