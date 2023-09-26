import 'package:calculator/constants.dart';
import 'package:calculator/provider/calculator_provider.dart';
import 'package:calculator/theme.dart';
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
            Consumer<CalculatorProvider>(
              builder: (context, value, child) => Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width / 40),
                height: MediaQuery.sizeOf(context).height / 3,
                decoration: BoxDecoration(color: Color(AppStrings.black)),
                alignment: Alignment.bottomRight,
                child: TextField(
                  keyboardType: TextInputType.none,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  controller: controller..text = value.result ?? '0',
                  onChanged: (val) {
                    value.pasteValue(val);
                  },
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NormalCalcButton(
                  buttonText: AppStrings.operatorsButtons['clear']!,
                  backgroundColor: Color(AppStrings.frontRowColor),
                  width: MediaQuery.sizeOf(context).width * 0.21,
                  height: MediaQuery.sizeOf(context).height * 0.1096,
                  onPressed: () {
                    Provider.of<CalculatorProvider>(context, listen: false)
                        .clear();
                  },
                ),
                NormalCalcButton(
                  buttonText: AppStrings.operatorsButtons['sign']!,
                  backgroundColor: Color(AppStrings.frontRowColor),
                  width: MediaQuery.sizeOf(context).width * 0.21,
                  height: MediaQuery.sizeOf(context).height * 0.1096,
                  onPressed: () {
                    Provider.of<CalculatorProvider>(context, listen: false)
                        .setOperation(AppStrings.operatorsButtons['sign']!);
                    Provider.of<CalculatorProvider>(context, listen: false)
                        .calculate();
                  },
                ),
                NormalCalcButton(
                  buttonText: AppStrings.operatorsButtons['percent']!,
                  backgroundColor: Color(AppStrings.frontRowColor),
                  onPressed: () {
                    context
                        .read<CalculatorProvider>()
                        .setOperation(AppStrings.operatorsButtons['percent']!);
                    Provider.of<CalculatorProvider>(context, listen: false)
                        .calculate();
                  },
                  width: MediaQuery.sizeOf(context).width * 0.21,
                  height: MediaQuery.sizeOf(context).height * 0.1096,
                ),
                NormalCalcButton(
                  buttonText: AppStrings.operatorsButtons['divide']!,
                  foregroundColor: AppStrings.white,
                  backgroundColor: Color(AppStrings.rightColBackground),
                  onPressed: () {
                    context
                        .read<CalculatorProvider>()
                        .setOperation(AppStrings.operatorsButtons['divide']!);
                    Provider.of<CalculatorProvider>(context, listen: false)
                        .calculate();
                  },
                  width: MediaQuery.sizeOf(context).width * 0.21,
                  height: MediaQuery.sizeOf(context).height * 0.1096,
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NormalCalcButton(
                  buttonText: AppStrings.numbersButtons['7']!,
                  foregroundColor: AppStrings.white,
                  backgroundColor: Color(AppStrings.numbersColor),
                  onPressed: () {
                    Provider.of<CalculatorProvider>(context, listen: false)
                        .addDigitToNum(AppStrings.numbersButtons['7']!);
                  },
                  width: MediaQuery.sizeOf(context).width * 0.21,
                  height: MediaQuery.sizeOf(context).height * 0.1096,
                ),
                NormalCalcButton(
                  buttonText: AppStrings.numbersButtons['8']!,
                  foregroundColor: AppStrings.white,
                  backgroundColor: Color(AppStrings.numbersColor),
                  onPressed: () {
                    Provider.of<CalculatorProvider>(context, listen: false)
                        .addDigitToNum(AppStrings.numbersButtons['8']!);
                  },
                  width: MediaQuery.sizeOf(context).width * 0.21,
                  height: MediaQuery.sizeOf(context).height * 0.1096,
                ),
                NormalCalcButton(
                  buttonText: AppStrings.numbersButtons['9']!,
                  foregroundColor: AppStrings.white,
                  backgroundColor: Color(AppStrings.numbersColor),
                  onPressed: () {
                    Provider.of<CalculatorProvider>(context, listen: false)
                        .addDigitToNum(AppStrings.numbersButtons['9']!);
                  },
                  width: MediaQuery.sizeOf(context).width * 0.21,
                  height: MediaQuery.sizeOf(context).height * 0.1096,
                ),
                NormalCalcButton(
                  buttonText: AppStrings.operatorsButtons['multiply']!,
                  foregroundColor: AppStrings.white,
                  backgroundColor: Color(AppStrings.rightColBackground),
                  onPressed: () {
                    context
                        .read<CalculatorProvider>()
                        .setOperation(AppStrings.operatorsButtons['multiply']!);
                    Provider.of<CalculatorProvider>(context, listen: false)
                        .calculate();
                  },
                  width: MediaQuery.sizeOf(context).width * 0.21,
                  height: MediaQuery.sizeOf(context).height * 0.1096,
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NormalCalcButton(
                  buttonText: AppStrings.numbersButtons['4']!,
                  foregroundColor: AppStrings.white,
                  backgroundColor: Color(AppStrings.numbersColor),
                  onPressed: () {
                    Provider.of<CalculatorProvider>(context, listen: false)
                        .addDigitToNum(AppStrings.numbersButtons['4']!);
                  },
                  width: MediaQuery.sizeOf(context).width * 0.21,
                  height: MediaQuery.sizeOf(context).height * 0.1096,
                ),
                NormalCalcButton(
                  buttonText: AppStrings.numbersButtons['5']!,
                  foregroundColor: AppStrings.white,
                  backgroundColor: Color(AppStrings.numbersColor),
                  onPressed: () {
                    Provider.of<CalculatorProvider>(context, listen: false)
                        .addDigitToNum(AppStrings.numbersButtons['5']!);
                  },
                  width: MediaQuery.sizeOf(context).width * 0.21,
                  height: MediaQuery.sizeOf(context).height * 0.1096,
                ),
                NormalCalcButton(
                  buttonText: AppStrings.numbersButtons['6']!,
                  foregroundColor: AppStrings.white,
                  backgroundColor: Color(AppStrings.numbersColor),
                  onPressed: () {
                    Provider.of<CalculatorProvider>(context, listen: false)
                        .addDigitToNum(AppStrings.numbersButtons['6']!);
                  },
                  width: MediaQuery.sizeOf(context).width * 0.21,
                  height: MediaQuery.sizeOf(context).height * 0.1096,
                ),
                NormalCalcButton(
                  buttonText: AppStrings.operatorsButtons['subtract']!,
                  foregroundColor: AppStrings.white,
                  backgroundColor: Color(AppStrings.rightColBackground),
                  onPressed: () {
                    context
                        .read<CalculatorProvider>()
                        .setOperation(AppStrings.operatorsButtons['subtract']!);
                    Provider.of<CalculatorProvider>(context, listen: false)
                        .calculate();
                  },
                  width: MediaQuery.sizeOf(context).width * 0.21,
                  height: MediaQuery.sizeOf(context).height * 0.1096,
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NormalCalcButton(
                  buttonText: AppStrings.numbersButtons['1']!,
                  foregroundColor: AppStrings.white,
                  backgroundColor: Color(AppStrings.numbersColor),
                  onPressed: () {
                    Provider.of<CalculatorProvider>(context, listen: false)
                        .addDigitToNum(AppStrings.numbersButtons['1']!);
                  },
                  width: MediaQuery.sizeOf(context).width * 0.21,
                  height: MediaQuery.sizeOf(context).height * 0.1096,
                ),
                NormalCalcButton(
                  buttonText: AppStrings.numbersButtons['2']!,
                  foregroundColor: AppStrings.white,
                  backgroundColor: Color(AppStrings.numbersColor),
                  onPressed: () {
                    Provider.of<CalculatorProvider>(context, listen: false)
                        .addDigitToNum(AppStrings.numbersButtons['2']!);
                  },
                  width: MediaQuery.sizeOf(context).width * 0.21,
                  height: MediaQuery.sizeOf(context).height * 0.1096,
                ),
                NormalCalcButton(
                  buttonText: AppStrings.numbersButtons['3']!,
                  foregroundColor: AppStrings.white,
                  backgroundColor: Color(AppStrings.numbersColor),
                  onPressed: () {
                    Provider.of<CalculatorProvider>(context, listen: false)
                        .addDigitToNum(AppStrings.numbersButtons['3']!);
                  },
                  width: MediaQuery.sizeOf(context).width * 0.21,
                  height: MediaQuery.sizeOf(context).height * 0.1096,
                ),
                NormalCalcButton(
                  buttonText: AppStrings.operatorsButtons['add']!,
                  foregroundColor: AppStrings.white,
                  backgroundColor: Color(AppStrings.rightColBackground),
                  onPressed: () {
                    context
                        .read<CalculatorProvider>()
                        .setOperation(AppStrings.operatorsButtons['add']!);
                    Provider.of<CalculatorProvider>(context, listen: false)
                        .calculate();
                  },
                  width: MediaQuery.sizeOf(context).width * 0.21,
                  height: MediaQuery.sizeOf(context).height * 0.1096,
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NormalCalcButton(
                  buttonText: AppStrings.numbersButtons['0']!,
                  foregroundColor: AppStrings.white,
                  backgroundColor: Color(AppStrings.numbersColor),
                  onPressed: () {
                    Provider.of<CalculatorProvider>(context, listen: false)
                        .addDigitToNum(AppStrings.numbersButtons['0']!);
                  },
                  width: MediaQuery.sizeOf(context).width * 0.45,
                  height: MediaQuery.sizeOf(context).height * 0.1096,
                ),
                NormalCalcButton(
                  buttonText: AppStrings.operatorsButtons['comma']!,
                  foregroundColor: AppStrings.white,
                  backgroundColor: Color(AppStrings.numbersColor),
                  onPressed: () {
                    Provider.of<CalculatorProvider>(context, listen: false)
                        .setOperation(AppStrings.operatorsButtons['comma']!);
                    Provider.of<CalculatorProvider>(context, listen: false)
                        .calculate();
                  },
                  width: MediaQuery.sizeOf(context).width * 0.21,
                  height: MediaQuery.sizeOf(context).height * 0.1096,
                ),
                NormalCalcButton(
                  buttonText: AppStrings.operatorsButtons['equal']!,
                  foregroundColor: AppStrings.white,
                  backgroundColor: Color(AppStrings.rightColBackground),
                  onPressed: () {
                    Provider.of<CalculatorProvider>(context, listen: false)
                        .setOperation(AppStrings.operatorsButtons['equal']!);
                    Provider.of<CalculatorProvider>(context, listen: false)
                        .calculate();
                  },
                  width: MediaQuery.sizeOf(context).width * 0.21,
                  height: MediaQuery.sizeOf(context).height * 0.1096,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NormalCalcButton extends StatelessWidget {
  const NormalCalcButton(
      {super.key,
      this.buttonText = '',
      required this.width,
      this.backgroundColor,
      required this.onPressed,
      this.foregroundColor,
      required this.height});

  final double height, width;

  final VoidCallback onPressed;

  final String buttonText;

  final Color? backgroundColor;

  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(backgroundColor),
            shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)))),
        onPressed: () {
          onPressed();
        },
        child: Text(
          buttonText,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: foregroundColor),
        ),
      ),
    );
  }
}
