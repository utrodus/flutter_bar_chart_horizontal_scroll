import 'package:flutter/material.dart';
import 'package:flutter_bar_chart_horizontal_scroll/widget/bar_chart_screen.dart';
import 'package:flutter_bar_chart_horizontal_scroll/widget/bar_chart_scroll.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        home: const BarChartScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
