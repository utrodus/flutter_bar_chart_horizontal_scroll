import 'package:flutter/material.dart';

import 'bar_chart_tooltip.dart';
import 'bar_chart_widget.dart';

class BarChartScreen extends StatefulWidget {
  const BarChartScreen({
    super.key,
  });

  @override
  State<BarChartScreen> createState() => _BarChartScreenState();
}

class _BarChartScreenState extends State<BarChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Icon(Icons.flutter_dash_rounded,
                    size: 42, color: Colors.blue),
                const SizedBox(width: 10),
                Text(
                  "Bar Chart Scroll",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          const Stack(
            clipBehavior: Clip.none,
            children: [
              BarChartWidget(),
              BarChartTooltip(),
            ],
          ),
        ],
      ),
    );
  }
}
