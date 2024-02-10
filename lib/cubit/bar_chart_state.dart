part of 'bar_chart_cubit.dart';

class BarChartState extends Equatable {
  final bool showTooltip;
  final double tooltipXPosition;
  final double tooltipYPosition;
  final double maxYValue;
  final double scrollXPosition;

  const BarChartState({
    required this.showTooltip,
    required this.tooltipXPosition,
    required this.tooltipYPosition,
    required this.maxYValue,
    required this.scrollXPosition,
  });

  /// copyWith method
  BarChartState copyWith({
    bool? showTooltip,
    double? tooltipXPosition,
    double? tooltipYPosition,
    double? maxYValue,
    double? scrollXPosition,
  }) {
    return BarChartState(
      showTooltip: showTooltip ?? this.showTooltip,
      tooltipXPosition: tooltipXPosition ?? this.tooltipXPosition,
      tooltipYPosition: tooltipYPosition ?? this.tooltipYPosition,
      maxYValue: maxYValue ?? this.maxYValue,
      scrollXPosition: scrollXPosition ?? this.scrollXPosition,
    );
  }

  @override
  List<Object?> get props => [
        showTooltip,
        tooltipXPosition,
        tooltipYPosition,
        maxYValue,
        scrollXPosition
      ];
}
