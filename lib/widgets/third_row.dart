import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../provider/calculator_provider.dart';
import 'normal_calc_button.dart';

class ThirdRow extends StatelessWidget {
  const ThirdRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
            Provider.of<CalculatorProvider>(context, listen: false).calculate();
          },
          width: MediaQuery.sizeOf(context).width * 0.21,
          height: MediaQuery.sizeOf(context).height * 0.1096,
        ),
      ],
    );
  }
}
