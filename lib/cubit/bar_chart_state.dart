part of 'bar_chart_cubit.dart';

class BarChartState extends Equatable {
  final bool showTooltip;
  final double tooltipXPosition;
  final double tooltipYPosition;

  final double maxYValue;

  const BarChartState({
    required this.showTooltip,
    required this.tooltipXPosition,
    required this.tooltipYPosition,
    required this.maxYValue,
  });

  /// copyWith method
  BarChartState copyWith({
    bool? showTooltip,
    double? tooltipXPosition,
    double? tooltipYPosition,
    double? maxYValue,
  }) {
    return BarChartState(
      showTooltip: showTooltip ?? this.showTooltip,
      tooltipXPosition: tooltipXPosition ?? this.tooltipXPosition,
      tooltipYPosition: tooltipYPosition ?? this.tooltipYPosition,
      maxYValue: maxYValue ?? this.maxYValue,
    );
  }

  @override
  List<Object?> get props => [showTooltip, tooltipXPosition, tooltipYPosition];
}
