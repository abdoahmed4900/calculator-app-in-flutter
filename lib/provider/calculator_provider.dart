import 'package:flutter/material.dart';

class CalculatorProvider extends ChangeNotifier {
  String? result;

  num? operationResult;

  num finalResult = 0;

  bool isChangeNum1 = true;

  num? num1;

  num? num2;

  String? operation;

  String? preEqualOp;

  void calculate() {
    switch (operation) {
      case "+":
      case "-":
      case "x":
      case "÷":
        preEqualOp = operation!;
        isChangeNum1 = false;
        break;
      case '+/-':
        preEqualOp = operation!;
        num1 = -num1!;
        finalResult = num1!;
        result = num1.toString();
        notifyListeners();
        break;
      case '%':
        preEqualOp = operation!;
        finalResult = double.parse((num1! / 100).toString());
        num1 = finalResult;
        result = finalResult.toStringAsFixed(2);
        notifyListeners();
        break;
      case ',':
        if (result != null) {
          if (isDouble(result!)) {
          } else {
            finalResult = double.parse('$result.0');
            result = '${result!}.';
            notifyListeners();
          }
        }
        break;
      case "=":
        performOperation();
        isChangeNum1 = true;
        num1 = finalResult;
        notifyListeners();
        break;
    }
  }

  void performOperation() {
    if (preEqualOp == '+') {
      finalResult = num1! + num2!;
    } else if (preEqualOp == '-') {
      finalResult = num1! - num2!;
    } else if (preEqualOp == 'x') {
      finalResult = num1! * num2!;
    } else if (preEqualOp == '÷') {
      finalResult = num1! / num2!;
      if (num2 == 0) {
        finalResult = 0;
        result = 'Error';
        notifyListeners();
        return;
      }
    }
    result = finalResult.toString();

    result = finalResult.toStringAsFixed(4);
  }

  void setOperation(String operation) {
    this.operation = operation;
    if (isOperationChanged(operation)) {
      num2 = null;
    }
  }

  bool isOperationChanged(String operation) =>
      preEqualOp != operation && operation != '=' && operation != ',';

  void addDigitToNum(String digit) {
    num n = 0;

    if (result == 'Error') {
      num1 = null;
      num2 = null;
    }

    if (num1 == null && num2 == null) {
      result = digit;
    } else if (num1 != null && num2 == null) {
      if (preEqualOp == null) {
        result = result! + digit;
      } else {
        result = digit;
      }
    } else if (num1 != null && num2 != null) {
      result = result! + digit;
    }

    if (isDouble(result!)) {
      n = double.parse(result!);
    } else {
      n = int.parse(result!);
    }

    if (isChangeNum1) {
      setNum1(n);
    } else {
      setNum2(n);
    }
    result = n.toString();
    notifyListeners();
  }

  void setNum1(num num1) {
    this.num1 = num1;
  }

  void setNum2(num num2) {
    this.num2 = num2;
  }

  void clear() {
    finalResult = 0;
    result = "0";
    operation = null;
    num1 = 0;
    num2 = null;
    preEqualOp = null;
    notifyListeners();
  }

  void pasteValue(String val) {
    result = "";
    notifyListeners();
    try {
      result = result! + val;
      if (isDouble(val)) {
        finalResult = double.parse(parseDouble(val));
      } else {
        finalResult = int.parse(val);
      }
      num1 = finalResult;
      result = num1.toString();
    } catch (e) {
      if (!isNumber(result!)) {
        clear();
      }
    }
    notifyListeners();
  }

  bool isDouble(String val) {
    if (val.contains(',') || val.contains('.')) {
      return true;
    }
    return false;
  }

  bool isNumber(String result) {
    bool isTrue = true;
    for (var i = 0; i < result.length; i++) {
      if (result[i] == ',' || result[i] == '.') {
      } else if (int.tryParse(result) != null) {
        continue;
      } else {
        isTrue = false;
        break;
      }
    }

    return isTrue;
  }

  String parseDouble(String val) {
    return val.replaceAll(',', '.');
  }
}
