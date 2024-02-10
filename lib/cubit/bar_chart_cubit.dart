import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bar_chart_state.dart';

class BarChartCubit extends Cubit<BarChartState> {
  BarChartCubit()
      : super(
          const BarChartState(
            showTooltip: false,
            tooltipXPosition: 0,
            tooltipYPosition: 0,
            maxYValue: 0,
            scrollXPosition: 0,
          ),
        );

  void showTooltip({
    double? x,
    double? y,
    bool? show,
    double? maxYValue,
    double? scrollXPosition,
  }) {
    emit(
      state.copyWith(
        showTooltip: show,
        tooltipXPosition: x,
        tooltipYPosition: y,
        maxYValue: maxYValue,
        scrollXPosition: scrollXPosition,
      ),
    );
  }
}
