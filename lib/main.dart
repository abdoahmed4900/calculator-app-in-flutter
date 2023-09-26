import 'package:calculator/constants.dart';
import 'package:calculator/provider/calculator_provider.dart';
import 'package:calculator/theme.dart';
import 'package:calculator/widgets/calculator_field.dart';
import 'package:calculator/widgets/normal_calc_button.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildOperationCalcButton(
                    context: context,
                    operation: 'AC',
                    foregroundColor: AppStrings.white,
                    onPress: () {
                      Provider.of<CalculatorProvider>(context, listen: false)
                          .clear();
                    },
                    backgroundColor: AppStrings.rightColBackground),
                buildOperationCalcButton(
                    context: context,
                    operation: '+/-',
                    foregroundColor: AppStrings.white,
                    backgroundColor: AppStrings.rightColBackground),
                buildOperationCalcButton(
                    context: context,
                    operation: '%',
                    foregroundColor: AppStrings.white,
                    backgroundColor: AppStrings.rightColBackground),
                buildOperationCalcButton(
                    context: context,
                    operation: '÷',
                    foregroundColor: AppStrings.white,
                    backgroundColor: AppStrings.rightColBackground),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildNormalCalcButton(context: context, number: 7),
                buildNormalCalcButton(context: context, number: 8),
                buildNormalCalcButton(context: context, number: 9),
                buildOperationCalcButton(
                    context: context,
                    operation: 'x',
                    backgroundColor: AppStrings.rightColBackground,
                    foregroundColor: AppStrings.white),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildNormalCalcButton(context: context, number: 4),
                buildNormalCalcButton(context: context, number: 5),
                buildNormalCalcButton(context: context, number: 6),
                buildOperationCalcButton(
                    context: context,
                    operation: '-',
                    backgroundColor: AppStrings.rightColBackground,
                    foregroundColor: AppStrings.white),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildNormalCalcButton(context: context, number: 1),
                buildNormalCalcButton(context: context, number: 2),
                buildNormalCalcButton(context: context, number: 3),
                buildOperationCalcButton(
                    context: context,
                    operation: '+',
                    backgroundColor: AppStrings.rightColBackground,
                    foregroundColor: AppStrings.white)
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildNormalCalcButton(context: context, number: 0, width: 0.45),
                buildOperationCalcButton(
                    context: context,
                    operation: ',',
                    foregroundColor: AppStrings.white,
                    backgroundColor: AppStrings.numbersColor),
                buildOperationCalcButton(
                    context: context,
                    operation: '=',
                    backgroundColor: AppStrings.rightColBackground,
                    foregroundColor: AppStrings.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
