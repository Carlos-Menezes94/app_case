import 'package:app_random_numbers/app/core/screen_utility_mixin.dart';
import 'package:app_random_numbers/app/ui/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with ScreenUtilityMixin {
  final HomeController _controller = GetIt.I.get<HomeController>();

  final _scrollController = ScrollController();

  bool _showScrollToTopButton = false;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 100) {
        setState(() {
          _showScrollToTopButton = true;
        });
      } else {
        setState(() {
          _showScrollToTopButton = false;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.homeStore.storeContextHome.value = context;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: const Center(
            child: Text('Home'),
          ),
        ),
        body: ValueListenableBuilder(
          valueListenable: _controller.homeStore.storeState,
          builder: (BuildContext context, state, Widget? child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  TextFormField(
                    onFieldSubmitted: (value) {
                      _controller.getListNumbersRandom(numberCount: value);
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      _controller.homeStore.storeQaunt.value = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Quantos números deseja?',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00434C),
                          ),
                          onPressed: () {
                            _controller.getListNumbersRandom(
                                numberCount:
                                    _controller.homeStore.storeQaunt.value);
                          },
                          child: const Text('Gerar lista'),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF00434C)),
                          onPressed: _controller.homeStore
                                  .storeListRandomNumbers.value.isNotEmpty
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
                          onPressed: _controller.homeStore
                                  .storeListRandomNumbers.value.isNotEmpty
                              ? () {
                                  _controller.sortRandomNumbers();
                                }
                              : null,
                          child: const Text('Ordem crescente'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  _controller.homeStore.storeState.value.isLoading()
                      ? const CircularProgressIndicator(
                          backgroundColor: Color(0xFF00434C),
                        )
                      : _controller
                              .homeStore.storeListRandomNumbers.value.isEmpty
                          ? Flexible(
                              child: Column(
                                children: [
                                  Flexible(
                                    child: Lottie.asset(
                                      'lib/app/core/assets/ghost_list_empty_lottie.json',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const Text(
                                    'Lista está vazia, digite um número no campo acima',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            )
                          : Expanded(
                              child: PrimaryScrollController(
                                controller: _scrollController,
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                    canvasColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                  ),
                                  child: ReorderableListView(
                                    onReorder: (oldIndex, newIndex) {
                                      if (newIndex > oldIndex) {
                                        newIndex--;
                                      }

                                      _controller.reorderListRandomNumbers(
                                          oldIndex, newIndex);
                                    },
                                    onReorderStart: (int index) {
                                      _controller.homeStore.stateDraggedIndex
                                          .value = index;
                                    },
                                    onReorderEnd: (int index) {
                                      _controller.homeStore.stateDraggedIndex
                                          .value = null;
                                    },
                                    children: List.generate(
                                      _controller.homeStore
                                          .storeListRandomNumbers.value.length,
                                      (index) {
                                        return Container(
                                          key: ValueKey(_controller
                                              .homeStore
                                              .storeListRandomNumbers
                                              .value[index]),
                                          child: ListTile(
                                            enableFeedback: true,
                                            title: Text(
                                              'Número - ${_controller.homeStore.storeListRandomNumbers.value[index]}',
                                              style:
                                                  const TextStyle(fontSize: 24),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: _showScrollToTopButton
            ? FloatingActionButton(
                onPressed: _scrollToTop,
                child: const Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                ),
              )
            : null,
      ),
    );
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
