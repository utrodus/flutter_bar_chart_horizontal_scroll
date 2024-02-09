import 'dart:ui';

import 'package:flutter_bar_chart_horizontal_scroll/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bar_chart_widget.dart';
import 'cubit/bar_chart_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BarChartCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        themeMode: ThemeMode.dark,
        home: const BarChartScroll(title: 'Flutter Demo Home Page'),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class BarChartScroll extends StatefulWidget {
  const BarChartScroll({super.key, required this.title});

  final String title;

  @override
  State<BarChartScroll> createState() => _BarChartScrollState();
}

class _BarChartScrollState extends State<BarChartScroll> {
  late ScrollController _scrollController;

  double scrollXPosition = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      scrollXPosition = _scrollController.offset;
    });
  }

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
          BlocBuilder<BarChartCubit, BarChartState>(
            builder: (context, state) {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  SingleChildScrollView(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    padding: const EdgeInsets.only(top: 10, right: 60),
                    child: Container(
                      width: 40 * barChartdata.length.toDouble(),
                      height: MediaQuery.of(context).size.height * 0.4,
                      margin: const EdgeInsets.only(top: 30),
                      child: const BarChartWidget(),
                    ),
                  ),
                  Positioned(
                    left: scrollXPosition > 0
                        ? state.tooltipXPosition - scrollXPosition
                        : state.tooltipXPosition,
                    top: state.maxYValue > 0
                        ? state.tooltipYPosition - 22
                        : state.tooltipYPosition + 45,
                    child: IgnorePointer(
                      ignoring: true,
                      child: Visibility(
                        visible: state.showTooltip,
                        child: ClipRect(
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
                      ),
                    ),
                  ),
                  Positioned(
                    left: scrollXPosition > 0
                        ? state.tooltipXPosition - scrollXPosition
                        : state.tooltipXPosition,
                    top: state.maxYValue > 0
                        ? state.tooltipYPosition - 22
                        : state.tooltipYPosition + 45,
                    child: IgnorePointer(
                      ignoring: true,
                      child: Visibility(
                        visible: state.showTooltip,
                        child: Container(
                          width: 126,
                          height: 58,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
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
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
