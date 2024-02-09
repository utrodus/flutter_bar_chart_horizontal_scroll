import 'package:flutter_bar_chart_horizontal_scroll/data.dart';
import 'package:flutter/material.dart';

import 'bar_chart_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      home: const BarChartScroll(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
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
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                padding: const EdgeInsets.only(top: 10, right: 10),
                child: Container(
                  width: 40 * barChartdata.length.toDouble(),
                  height: MediaQuery.of(context).size.height * 0.4,
                  margin: const EdgeInsets.only(top: 30),
                  child: const BarChartWidget(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
