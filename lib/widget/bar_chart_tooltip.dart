import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bar_chart_horizontal_scroll/widget/bar_chart_notifier.dart';

class BarChartTooltip extends StatelessWidget {
  final BarChartStateNotifier state;

  const BarChartTooltip({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: state.scrollXPosition > 0
          ? state.tooltipXPosition - state.scrollXPosition + 35
          : state.tooltipXPosition + 35,
      top: state.maxYValue > 0
          ? state.tooltipYPosition - 35
          : state.tooltipYPosition + 35,
      child: IgnorePointer(
        ignoring: true,
        child: Visibility(
          visible: state.showTooltip,
          child: Stack(
            children: [
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 5,
                    sigmaY: 5,
                  ),
                  child: Container(
                    width: 126,
                    height: 58,
                    color: Colors.black.withOpacity(0),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn,
                child: Container(
                  width: 126,
                  height: 58,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.75),
                      borderRadius: BorderRadius.circular(6)),
                  child: const FittedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Units : 0.0%",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          "Total Cost : 0.0%",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          "Total Revenue : 0.0%",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
