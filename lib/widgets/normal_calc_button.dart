import 'package:flutter/material.dart';

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
