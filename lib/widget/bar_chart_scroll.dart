import 'package:flutter/material.dart';
import 'package:flutter_bar_chart_horizontal_scroll/cubit/bar_chart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bar_chart_tooltip.dart';
import 'bar_chart_widget.dart';

class BarChartScroll extends StatefulWidget {
  const BarChartScroll({
    super.key,
  });

  @override
  State<BarChartScroll> createState() => _BarChartScrollState();
}

class _BarChartScrollState extends State<BarChartScroll> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _initBarChartScroll();
  }

  void _initBarChartScroll() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      _onScroll();
    });
  }

  void _onScroll() => context.read<BarChartCubit>().showTooltip(
        scrollXPosition: _scrollController.offset,
      );

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
          Stack(
            clipBehavior: Clip.none,
            children: [
              BarChartWidget(
                scrollController: _scrollController,
              ),
              const BarChartTooltip(),
            ],
          ),
        ],
      ),
    );
  }
}
