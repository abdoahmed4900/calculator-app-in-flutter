import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../provider/calculator_provider.dart';
import 'normal_calc_button.dart';

class SecondRow extends StatelessWidget {
  const SecondRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
            Provider.of<CalculatorProvider>(context, listen: false).calculate();
          },
          width: MediaQuery.sizeOf(context).width * 0.21,
          height: MediaQuery.sizeOf(context).height * 0.1096,
        ),
      ],
    );
  }
}
