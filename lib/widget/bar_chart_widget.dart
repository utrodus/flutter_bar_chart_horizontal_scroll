import 'package:flutter/material.dart';

import 'bar_chart_left_axis.dart';
import 'bar_chart_notifier.dart';
import 'bar_chart_scroll.dart';
import 'dashed_horizontal_line.dart';

class BarChartWidget extends StatelessWidget {
  final BarChartNotifier notifier;

  const BarChartWidget({Key? key, required this.notifier}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BarChartScroll(notifier: notifier),
        const BarChartLeftAxis(),
        ValueListenableBuilder<BarChartStateNotifier>(
          valueListenable: notifier,
          builder: (context, state, _) {
            return Positioned(
              left: MediaQuery.of(context).size.width * 0.1,
              top: state.tooltipYPosition + 30,
              child: Visibility(
                visible: state.showTooltip,
                child: DashedHorizontalLine(
                  width: state.scrollXPosition > 0
                      ? state.tooltipXPosition - state.scrollXPosition - 3
                      : state.tooltipXPosition - 3,
                  height: 1,
                  color: Colors.orange,
                  strokeWidth: 1,
                  dashWidth: 5,
                  dashSpace: 5,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
