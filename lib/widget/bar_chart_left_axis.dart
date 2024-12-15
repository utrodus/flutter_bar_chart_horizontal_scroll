import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bar_chart_horizontal_scroll/data.dart';

class BarChartLeftAxis extends StatelessWidget {
  const BarChartLeftAxis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.5,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            margin: const EdgeInsets.only(top: 30),
            child: BarChart(
              duration: const Duration(milliseconds: 150), // Optional
              curve: Curves.linear,
              BarChartData(
                maxY: 20,
                minY: -20,
                // groupsSpace: 30,
                alignment: BarChartAlignment.spaceBetween,
                barTouchData: BarTouchData(
                  handleBuiltInTouches: false,
                  enabled: false,
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return null;
                    },
                  ),
                ),

                titlesData: FlTitlesData(
                  show: true,
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 32,
                      getTitlesWidget: bottomTitles,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: leftTitles,
                      // interval: 5,
                      reservedSize: 50,
                    ),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                ),
                gridData: const FlGridData(
                  show: false,
                  drawVerticalLine: false,
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                barGroups: barChartdata.entries
                    .map(
                      (e) => generateGroup(
                        e.key,
                        e.value[0],
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(color: Colors.transparent, fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Mon';
        break;
      case 1:
        text = 'Tue';
        break;
      case 2:
        text = 'Wed';
        break;
      case 3:
        text = 'Thu';
        break;
      case 4:
        text = 'Fri';
        break;
      case 5:
        text = 'Sat';
        break;
      case 6:
        text = 'Sun';
        break;

      case 7:
        text = 'Mon';
        break;

      case 8:
        text = 'Tue';
        break;

      case 9:
        text = 'Wed';
        break;

      case 10:
        text = 'Thu';
        break;

      case 11:
        text = 'Fri';
        break;

      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    var style = const TextStyle(color: Colors.black, fontSize: 10);
    String text;
    if (value == 0) {
      text = '0';
    } else {
      text = value.toInt().toString();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 20,
      child: Text(
        text,
        style: style,
        textAlign: TextAlign.center,
      ),
    );
  }

  BarChartGroupData generateGroup(
    int x,
    double value,
  ) {
    final isBarItemTop = value > 0;
    return BarChartGroupData(
      x: x,
      showingTooltipIndicators: [],
      barsSpace: 20,
      barRods: [
        BarChartRodData(
          toY: value,
          width: 22,
          color: Colors.transparent,
          borderRadius: isBarItemTop
              ? const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                )
              : const BorderRadius.only(
                  bottomLeft: Radius.circular(6),
                  bottomRight: Radius.circular(6),
                ),
        ),
      ],
    );
  }
}
