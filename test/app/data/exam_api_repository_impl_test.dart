import 'package:app_random_numbers/app/data/repositories/exam_api_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ExamApi Tests', () {
    late ExamApiImpl examApi;

    // Inicializa a instância antes de cada teste
    setUp(() {
      examApi = ExamApiImpl();
    });

    test('getRandomNumbers should return the correct number of random numbers',
        () {
      const int quantity = 5;
      final List<int> randomNumbers = examApi.getRandomNumbers(quantity);

      expect(randomNumbers.length, quantity);
    });

    test('getRandomNumbers should not return null values', () {
      final List<int> randomNumbers = examApi.getRandomNumbers(10);

      for (int number in randomNumbers) {
        expect(number, isNotNull);
      }
    });

    test('getRandomNumbers should return numbers within the specified range',
        () {
      final List<int> randomNumbers = examApi.getRandomNumbers(100);

      // Verifica se todos os números estão entre 0 e 99
      for (int number in randomNumbers) {
        expect(number, inInclusiveRange(0, 99));
      }
    });
  });
}
