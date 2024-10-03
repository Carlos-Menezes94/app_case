import 'package:app_random_numbers/app/core/screen_utility_mixin.dart';
import 'package:app_random_numbers/app/ui/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ButtonsHomeWidget extends StatefulWidget {
  const ButtonsHomeWidget({super.key});

  @override
  State<ButtonsHomeWidget> createState() => _ButtonsHomeWidgetState();
}

class _ButtonsHomeWidgetState extends State<ButtonsHomeWidget>
    with ScreenUtilityMixin {
  final HomeController _controller = GetIt.I.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    final spaceBetweenButtons = SizedBox(width: setWidth(8));

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
                        numberCount: _controller
                            .homeStore.storeAmountRandomNumbers.value);
                  },
                  child: const Text('Gerar lista'),
                ),
                spaceBetweenButtons,
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
                spaceBetweenButtons,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00434C)),
                  onPressed: _controller
                          .homeStore.storeListRandomNumbers.value.isNotEmpty
                      ? () {
                          _controller.verifyAscendingOrderList();
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
