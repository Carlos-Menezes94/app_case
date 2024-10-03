import 'package:app_random_numbers/app/data/repositories/exam_api_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ExamApi Tests', () {
    late ExamApiImpl examApi;

    setUp(() {
      examApi = ExamApiImpl();
    });

    test('Should return the correct number of random numbers', () {
      const int quantity = 5;
      final List<int> randomNumbers = examApi.getRandomNumbers(quantity);
      //Verificar se está retornando quantidade de números certo
      expect(randomNumbers.length, quantity);
    });

    test('Should not return null values', () {
      final List<int> randomNumbers = examApi.getRandomNumbers(10);

      for (int number in randomNumbers) {
        expect(number, isNotNull);
      }
    });

    test('Should return true when checking an unordered list', () {
      final listRandomNumbers = [100, 1, 88, 3, 8, 29];

      final randomNumbers = examApi.checkOrder(listRandomNumbers);

      expect(randomNumbers, isTrue);
    });
  });
}
