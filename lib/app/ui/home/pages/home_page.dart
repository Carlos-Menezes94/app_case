import 'package:app_random_numbers/app/core/screen_utility_mixin.dart';
import 'package:app_random_numbers/app/ui/home/controllers/home_controller.dart';
import 'package:app_random_numbers/app/ui/home/widgets/buttons_home_widget.dart';
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
          toolbarHeight: setHeight(80),
          title: const Center(
            child: Text('Home'),
          ),
        ),
        body: ValueListenableBuilder(
          valueListenable: _controller.homeStore.storeState,
          builder: (BuildContext context, state, Widget? child) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: setWidth(16)),
              child: Column(
                children: [
                  SizedBox(height: setHeight(20)),
                  Form(
                    key: _controller.homeStore.stateFormKey.value,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira um valor';
                        }

                        if (value == '0') {
                          return 'Digite um número acima de 0';
                        }
                        return null;
                      },
                      maxLength: 6,
                      controller:
                          _controller.homeStore.stateControllerEditing.value,
                      onFieldSubmitted: (value) {
                        _controller.getListNumbersRandom(numberCount: value);
                      },
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        if (int.parse(value) > 0) {
                          _controller.homeStore.storeAmountRandomNumbers.value =
                              value;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Quantos números deseja?',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(setRadius(30)),
                          borderSide: BorderSide(
                              color: Colors.blue, width: setWidth(2)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: setHeight(20)),
                  FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const ButtonsHomeWidget(),
                        SizedBox(width: setWidth(8)),
                      ],
                    ),
                  ),
                  SizedBox(height: setHeight(20)),
                  if (_controller
                      .homeStore.storeListRandomNumbers.value.isNotEmpty)
                    Text(
                        'Quantidade de itens na lista: ${_controller.homeStore.storeAmountRandomNumbers.value}'),
                  SizedBox(height: setHeight(20)),
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
                                  Text(
                                    'Lista está vazia, digite um número no campo acima',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: setFontSize(18)),
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
                                  child: ReorderableListView.builder(
                                    itemCount: _controller.homeStore
                                        .storeListRandomNumbers.value.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        key: ValueKey(index),
                                        margin: EdgeInsets.symmetric(
                                            vertical: setHeight(8)),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(0xFF00434C),
                                            width: setWidth(2),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            'Número - ${_controller.homeStore.storeListRandomNumbers.value[index]}',
                                            style: TextStyle(
                                                fontSize: setFontSize(24)),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      );
                                    },
                                    onReorder: (oldIndex, newIndex) {
                                      if (newIndex > oldIndex) {
                                        newIndex--;
                                      }
                                      _controller.reorderListRandomNumbers(
                                          oldIndex, newIndex);
                                    },
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
                onPressed: () {
                  _scrollToTop();
                },
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
