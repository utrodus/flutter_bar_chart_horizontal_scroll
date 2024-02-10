import 'package:flutter/material.dart';
import 'package:flutter_bar_chart_horizontal_scroll/cubit/bar_chart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bar_chart_left_axis.dart';
import 'bar_chart_scroll.dart';
import 'dashed_horizontal_line.dart';

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BarChartScroll(),

        const BarChartLeftAxis(),

        /// draw a horizontal line to the y-axis
        BlocBuilder<BarChartCubit, BarChartState>(
          builder: (context, state) {
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
