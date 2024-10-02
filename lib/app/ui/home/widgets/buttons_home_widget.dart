import 'package:app_random_numbers/app/ui/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ButtonsHomeWidget extends StatefulWidget {
  const ButtonsHomeWidget({super.key});

  @override
  State<ButtonsHomeWidget> createState() => _ButtonsHomeWidgetState();
}

class _ButtonsHomeWidgetState extends State<ButtonsHomeWidget> {
  final HomeController _controller = GetIt.I.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _controller.homeStore.storeListRandomNumbers,
        builder: (BuildContext context, state, Widget? child) {
          return FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00434C),
                  ),
                  onPressed: () {
                    _controller.getListNumbersRandom(
                        numberCount: _controller.homeStore.storeQaunt.value);
                  },
                  child: const Text('Gerar lista'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00434C)),
                  onPressed: _controller
                          .homeStore.storeListRandomNumbers.value.isNotEmpty
                      ? () {
                          _controller.clearListRandomNumbers();
                        }
                      : null,
                  child: const Text('Limpar lista'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00434C)),
                  onPressed: _controller
                          .homeStore.storeListRandomNumbers.value.isNotEmpty
                      ? () {
                          _controller.sortRandomNumbers();
                        }
                      : null,
                  child: const Text('Ordem crescente'),
                ),
              ],
            ),
          );
        });
  }
}
