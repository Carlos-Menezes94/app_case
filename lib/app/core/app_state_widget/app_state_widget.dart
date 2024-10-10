import 'package:app_random_numbers/app/core/mixins/screen_utility_mixin.dart';
import 'package:app_random_numbers/app/core/utils/app_state_util.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppStateWidget extends StatefulWidget {
  final Widget Function()? customLoading;
  final Widget Function()? customError;
  final Widget? child;
  final bool overlay;
  final ValueNotifier<AppStateUtil> appState;
  final bool? hasGradient;
  final bool? hasErrorPage;

  const AppStateWidget({
    super.key,
    required this.appState,
    this.child,
    this.overlay = false,
    this.customLoading,
    this.customError,
    this.hasGradient = false,
    this.hasErrorPage = false,
  });

  @override
  AppStateWidgetState createState() => AppStateWidgetState();
}

class AppStateWidgetState extends State<AppStateWidget>
    with ScreenUtilityMixin {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.appState,
      builder: (BuildContext context, state, Widget? child) {
        final currentState = widget.appState.value;
        switch (true) {
          case true when currentState.isLoading():
            return widget.customLoading?.call() ?? _defaultLoadingWidget();
          default:
            return widget.child ?? const SizedBox.shrink();
        }
      },
    );
  }

  Widget _defaultLoadingWidget() {
    if (widget.overlay) {
      return Stack(
        children: [
          widget.child ?? const SizedBox.shrink(),
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.75),
            ),
            child: Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                key: const Key('loading_animation'),
                color: Colors.black,
                size: 60,
              ),
            ),
          ),
        ],
      );
    }
    return Container(
      decoration: widget.hasGradient!
          ? BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.yellow.shade700,
                  Colors.orangeAccent,
                  Colors.yellow.shade300,
                ],
              ),
            )
          : null,
      child: Center(
        child: LoadingAnimationWidget.fourRotatingDots(
          key: const Key('loading_animation'),
          color: Colors.black,
          size: 60,
        ),
      ),
    );
  }
}
