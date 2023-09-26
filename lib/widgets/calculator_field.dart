import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../provider/calculator_provider.dart';

class CalculatorField extends StatelessWidget {
  const CalculatorField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorProvider>(
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
    );
  }
}
