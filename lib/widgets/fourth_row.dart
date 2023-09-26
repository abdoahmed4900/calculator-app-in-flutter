import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../provider/calculator_provider.dart';
import 'normal_calc_button.dart';

class FourthRow extends StatelessWidget {
  const FourthRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
            Provider.of<CalculatorProvider>(context, listen: false).calculate();
          },
          width: MediaQuery.sizeOf(context).width * 0.21,
          height: MediaQuery.sizeOf(context).height * 0.1096,
        ),
      ],
    );
  }
}
