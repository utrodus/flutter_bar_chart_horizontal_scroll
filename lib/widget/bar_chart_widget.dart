import 'package:flutter/material.dart';

import 'bar_chart_left_axis.dart';
import 'bar_chart_scroll.dart';

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BarChartScroll(),
        Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width * 0.1,
          height: MediaQuery.of(context).size.height * 0.41,
        ),
        const BarChartLeftAxis(),
      ],
    );
  }
}
