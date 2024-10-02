import 'dart:math';

import 'package:app_random_numbers/app/data/repositories/exam_api_repository_abstract.dart';

class ExamApiImpl extends ExamApiRepositoryAbstract {
  final Random _random = Random();

  @override
  List<int> getRandomNumbers(int quantity) {
    if (quantity > 100) {
      throw ArgumentError('Quantity cannot be greater than 100.');
    }

    //Greando lista de numeros até o 100
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
        return false;
      }
    }
    return true;
  }
}

// void main() {
//   ExamApiRepositorympl api = ExamApiImpl();

//   // Testando a função getRandomNumbers
//   List<int> randomNumbers = api.getRandomNumbers(5);
//   print("Números aleatórios: $randomNumbers");

//   // Testando a função checkOrder
//   bool isOrdered = api.checkOrder(randomNumbers);
//   print("A lista está em ordem crescente? $isOrdered");
// }
