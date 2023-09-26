import 'package:calculator/provider/calculator_provider.dart';
import 'package:calculator/theme.dart';
import 'package:calculator/widgets/calculator_field.dart';
import 'package:calculator/widgets/fifth_row.dart';
import 'package:calculator/widgets/first_row.dart';
import 'package:calculator/widgets/fourth_row.dart';
import 'package:calculator/widgets/second_row.dart';
import 'package:calculator/widgets/third_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculatorProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            CalculatorField(controller: controller),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 25,
            ),
            const FirstRow(),
            const Spacer(),
            const SecondRow(),
            const Spacer(),
            const ThirdRow(),
            const Spacer(),
            const FourthRow(),
            const Spacer(),
            const FifthRow(),
          ],
        ),
      ),
    );
  }
}
