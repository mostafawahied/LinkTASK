import 'package:flutter/material.dart';

import '../enums/app_state.dart';
import 'loading_widget.dart';

class AppStateHandlerWidget extends StatelessWidget {
  final Function()? onRetry;
  final Widget child;
  final AppState state;
  final bool isShimmer;
  final Widget? onEmpty;
  final bool? isEmpty;
  final Widget? onWaiting;
  final Function()? onTryAgain;
  final bool emptyWhileLoading;
  final Color? color;
  final double? height;

  const AppStateHandlerWidget({
    Key? key,
    required this.child,
    required this.state,
    this.onRetry,
    this.isShimmer = false,
    this.onEmpty,
    this.onTryAgain,
    this.isEmpty = false,
    this.onWaiting,
    this.color,
    this.emptyWhileLoading = false,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      // alignment: Alignment.center,
      children: [
        child,
        if (state == AppState.loading)
          LoadingStateWidget(
            color: color,
            height: height,
          )
      ],
    );
  }
}
