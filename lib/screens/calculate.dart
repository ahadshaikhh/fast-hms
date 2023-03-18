class calculator {
  calculator({required this.weight, required this.height});
  final int height;
  final int weight;
  late double bmi;
  String calbmi() {
    bmi = height / 100;
    bmi = bmi * bmi;
    bmi = weight / bmi;

    return bmi.toStringAsFixed(1);
  }

  String calbmi2() {
    if (bmi < 20) {
      return 'UNDERWEIGHT';
    } else if (bmi >= 20 && bmi < 25) {
      return 'NORMAL';
    } else if (bmi >= 25) {
      return 'OVERWEIGHT';
    }
    return '0';
  }

  String calbmi3() {
    if (bmi < 20) {
      return 'YOUR BMI IS TOO LESS! YOU SHOULD EAT MORE KFC';
    } else if (bmi >= 20 && bmi < 25) {
      return 'YOUR BMI IS NORMAL, KINDLY MAINTAIN YOUR WEIGHT';
    } else if (bmi >= 25) {
      return 'YOUR BMI IS ABOVE NORMAL, KINDLY REDUCE YOUR WEIGHT';
    }
    return '0';
  }
}
