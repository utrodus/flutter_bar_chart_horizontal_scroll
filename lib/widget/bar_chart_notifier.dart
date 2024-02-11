import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BarChartNotifier extends ValueNotifier<BarChartStateNotifier> {
  BarChartNotifier()
      : super(
          const BarChartStateNotifier(
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
    value = value.copyWith(
      showTooltip: show,
      tooltipXPosition: x,
      tooltipYPosition: y,
      maxYValue: maxYValue,
      scrollXPosition: scrollXPosition,
    );
  }
}

class BarChartStateNotifier extends Equatable {
  final bool showTooltip;
  final double tooltipXPosition;
  final double tooltipYPosition;
  final double maxYValue;
  final double scrollXPosition;

  const BarChartStateNotifier({
    required this.showTooltip,
    required this.tooltipXPosition,
    required this.tooltipYPosition,
    required this.maxYValue,
    required this.scrollXPosition,
  });

  BarChartStateNotifier copyWith({
    bool? showTooltip,
    double? tooltipXPosition,
    double? tooltipYPosition,
    double? maxYValue,
    double? scrollXPosition,
  }) {
    return BarChartStateNotifier(
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
