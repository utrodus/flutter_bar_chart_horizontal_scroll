import 'package:flutter_bar_chart_horizontal_scroll/data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartWidget extends StatefulWidget {
  const BarChartWidget({super.key});

  @override
  State<StatefulWidget> createState() => BarChartWidgetState();
}

class BarChartWidgetState extends State<BarChartWidget> {
  static const shadowOpacity = 0.2;
  int touchedIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      swapAnimationDuration: const Duration(milliseconds: 150), // Optional
      swapAnimationCurve: Curves.linear, //
      BarChartData(
        maxY: 20,
        minY: -20,
        // groupsSpace: 30,
        alignment: BarChartAlignment.spaceEvenly,
        barTouchData: BarTouchData(
          handleBuiltInTouches: false,
          touchCallback: (FlTouchEvent event, barTouchResponse) {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              setState(() {
                touchedIndex = -1;
              });
              return;
            }
            final rodIndex = barTouchResponse.spot!.touchedRodDataIndex;
            if (isShadowBar(rodIndex)) {
              setState(() {
                touchedIndex = -1;
              });
              return;
            }
            setState(() {
              touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
            });
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(
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
              reservedSize: 42,
            ),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
        ),
        gridData: FlGridData(
          show: true,
          checkToShowHorizontalLine: (value) => value % 5 == 0,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (value) {
            if (value == 0) {
              return FlLine(
                color: Colors.black.withOpacity(0.1),
                strokeWidth: 3,
              );
            }
            return FlLine(
              color: Colors.transparent,
              strokeWidth: 0.8,
            );
          },
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
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(color: Colors.black, fontSize: 10);
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
    const style = TextStyle(color: Colors.black, fontSize: 10);
    String text;
    if (value == 0) {
      text = '0';
    } else {
      text = value.toInt().toString();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
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
    final isTouched = touchedIndex == x;
    return BarChartGroupData(
      x: x,
      showingTooltipIndicators: isTouched ? [0] : [],
      barsSpace: 20,
      barRods: [
        BarChartRodData(
          toY: value,
          width: 22,
          color: isBarItemTop ? Colors.green : Colors.red,
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

  bool isShadowBar(int rodIndex) => rodIndex == 1;
}
