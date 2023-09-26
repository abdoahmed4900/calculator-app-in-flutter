import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../provider/calculator_provider.dart';
import 'normal_calc_button.dart';

class FifthRow extends StatelessWidget {
  const FifthRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
            Provider.of<CalculatorProvider>(context, listen: false).calculate();
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
            Provider.of<CalculatorProvider>(context, listen: false).calculate();
          },
          width: MediaQuery.sizeOf(context).width * 0.21,
          height: MediaQuery.sizeOf(context).height * 0.1096,
        ),
      ],
    );
  }
}
