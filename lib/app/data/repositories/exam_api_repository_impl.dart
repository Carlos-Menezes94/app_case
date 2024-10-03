import 'dart:math';

import 'package:app_random_numbers/app/data/repositories/exam_api_repository_abstract.dart';

class ExamApiImpl extends ExamApiRepositoryAbstract {
  final Random _random = Random();

  @override
  List<int> getRandomNumbers(int quantity) {
    if (quantity > 100) {
      throw ArgumentError('A quantidade não pode ser superior a 100');
    }

    //Gerando lista de numeros até o 100
    List<int> numbers = List.generate(100, (index) => index);

    //Embaralha a lista
    numbers.shuffle(_random);

    // Retorna os primeiros 'quantity' números
    return numbers.take(quantity).toList();
  }

  @override
  bool checkOrder(List<int> numbers) {
    for (int i = 1; i < numbers.length; i++) {
      if (numbers[i] < numbers[i - 1]) {
        return true;
      }
    }
    return false;
  }
}
