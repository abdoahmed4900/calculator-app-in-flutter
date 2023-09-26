import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../provider/calculator_provider.dart';
import 'normal_calc_button.dart';

class FirstRow extends StatelessWidget {
  const FirstRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        NormalCalcButton(
          buttonText: AppStrings.operatorsButtons['clear']!,
          backgroundColor: Color(AppStrings.frontRowColor),
          width: MediaQuery.sizeOf(context).width * 0.21,
          height: MediaQuery.sizeOf(context).height * 0.1096,
          onPressed: () {
            Provider.of<CalculatorProvider>(context, listen: false).clear();
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
            Provider.of<CalculatorProvider>(context, listen: false).calculate();
          },
        ),
        NormalCalcButton(
          buttonText: AppStrings.operatorsButtons['percent']!,
          backgroundColor: Color(AppStrings.frontRowColor),
          onPressed: () {
            context
                .read<CalculatorProvider>()
                .setOperation(AppStrings.operatorsButtons['percent']!);
            Provider.of<CalculatorProvider>(context, listen: false).calculate();
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
            Provider.of<CalculatorProvider>(context, listen: false).calculate();
          },
          width: MediaQuery.sizeOf(context).width * 0.21,
          height: MediaQuery.sizeOf(context).height * 0.1096,
        ),
      ],
    );
  }
}
