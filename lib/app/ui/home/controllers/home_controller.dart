import 'package:app_random_numbers/app/core/utils/app_state_util.dart';
import 'package:app_random_numbers/app/data/repositories/exam_api_repository_abstract.dart';
import 'package:app_random_numbers/app/ui/home/stores/home_store.dart';
import 'package:flutter/material.dart';

abstract class Controller extends Object {}

class HomeController extends Controller {
  final ExamApiRepositoryAbstract examApiRepository;
  final HomeStore homeStore;

  HomeController({required this.homeStore, required this.examApiRepository});

  getListNumbersRandom({required String numberCount}) async {
    homeStore.storeState.value = AppStateUtil.loading();

    final amountRandomNumbers =
        numberCount.isEmpty ? 0 : int.parse(numberCount);
    _delayRequest();

    if (amountRandomNumbers != 0 && amountRandomNumbers <= 100) {
      await _delayRequest();

      final response = examApiRepository.getRandomNumbers(amountRandomNumbers);
      homeStore.storeListRandomNumbers.value = response;
    } else {
      ScaffoldMessenger.of(homeStore.storeContextHome.value!)
          .showSnackBar(SnackBar(
        content: Center(
            child: Text(
          amountRandomNumbers > 100
              ? "Digite um número de 1 a 100"
              : "Digite um número no campo acima",
        )),
      ));
    }
    homeStore.storeState.value = AppStateUtil.success();
  }

  verifyListOrderCrescente() {
    final response =
        examApiRepository.checkOrder(homeStore.storeListRandomNumbers.value);
  }

  void sortRandomNumbers() {
    homeStore.storeState.value = AppStateUtil.loading();

    List<int> randomNumbers = homeStore.storeListRandomNumbers.value;

    //Verifica se a lista não está vazia antes de ordenar
    if (randomNumbers.isNotEmpty) {
      randomNumbers.sort();

      //Armazena a lista ordenada de volta na store
      homeStore.storeListRandomNumbers.value = randomNumbers;
    }
    homeStore.storeState.value = AppStateUtil.success();
  }

  //Limpar a lista de números aleatórios
  clearListRandomNumbers() async {
    homeStore.storeState.value = AppStateUtil.loading();
    await _delayRequest();
    homeStore.storeListRandomNumbers.value = [];
    homeStore.storeState.value = AppStateUtil.success();
  }

  //Função que simula o delay para o loading
  Future<void> _delayRequest() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  void reorderListRandomNumbers(int oldIndex, int newIndex) {
    final number = homeStore.storeListRandomNumbers.value.removeAt(oldIndex);
    homeStore.storeListRandomNumbers.value.insert(newIndex, number);

    homeStore.storeState.value = AppStateUtil.success();
  }
}
