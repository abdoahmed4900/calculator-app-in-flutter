import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../provider/calculator_provider.dart';

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
        onPressed: onPressed,
        child: Text(buttonText,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: foregroundColor)),
      ),
    );
  }
}

NormalCalcButton buildOperationCalcButton(
    {required BuildContext context,
    required String operation,
    VoidCallback? onPress,
    Color? backgroundColor,
    Color? foregroundColor}) {
  return NormalCalcButton(
    buttonText: operation,
    foregroundColor: foregroundColor,
    backgroundColor: backgroundColor,
    onPressed: onPress ??
        () {
          Provider.of<CalculatorProvider>(context, listen: false)
              .setOperation(operation);
          Provider.of<CalculatorProvider>(context, listen: false).calculate();
        },
    width: MediaQuery.sizeOf(context).width * 0.21,
    height: MediaQuery.sizeOf(context).height * 0.1096,
  );
}

NormalCalcButton buildNormalCalcButton(
    {required BuildContext context, required int number, num width = 0.21}) {
  return NormalCalcButton(
    buttonText: '$number',
    foregroundColor: AppStrings.white,
    backgroundColor: AppStrings.numbersColor,
    onPressed: () {
      Provider.of<CalculatorProvider>(context, listen: false)
          .addDigitToNum('$number');
    },
    width: MediaQuery.sizeOf(context).width * width,
    height: MediaQuery.sizeOf(context).height * 0.1096,
  );
}
