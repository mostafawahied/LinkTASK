import 'package:flutter/material.dart';
import 'package:link_task/commonWidgets/animations/top_bounce_container.dart';

class TopSnackBar extends StatefulWidget {
  final Widget child;
  final VoidCallback onDismissed;
  final Duration showOutAnimationDuration;
  final Duration hideOutAnimationDuration;
  final Duration displayDuration;
  final double additionalTopPadding;
  final VoidCallback? onTap;
  final double leftPadding;
  final double rightPadding;

  const TopSnackBar({
    Key? key,
    required this.child,
    required this.onDismissed,
    required this.showOutAnimationDuration,
    required this.hideOutAnimationDuration,
    required this.displayDuration,
    required this.additionalTopPadding,
    this.onTap,
    this.leftPadding = 16,
    this.rightPadding = 16,
  }) : super(key: key);

  @override
  TopSnackBarState createState() => TopSnackBarState();
}

class TopSnackBarState extends State<TopSnackBar>
    with TickerProviderStateMixin {
  Animation? offsetAnimation;
  AnimationController? animationController;
  double? topPosition;

  @override
  void initState() {
    topPosition = widget.additionalTopPadding;
    _setupAndStartAnimation();
    super.initState();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  void _setupAndStartAnimation() async {
    animationController = AnimationController(
      vsync: this,
      duration: widget.showOutAnimationDuration,
      reverseDuration: widget.hideOutAnimationDuration,
    );

    Tween<Offset> offsetTween = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: const Offset(0.0, 0.0),
    );

    offsetAnimation = offsetTween.animate(
      CurvedAnimation(
        parent: animationController!,
        curve: Curves.elasticOut,
        reverseCurve: Curves.linearToEaseOut,
      ),
    )..addStatusListener((status) async {
        final navigator = Navigator.of(context, rootNavigator: true);
        if (status == AnimationStatus.completed) {
          await Future.delayed(widget.displayDuration);
          if (mounted) {
            animationController!.reverse();
            setState(() {
              topPosition = 0;
            });
          }
        }

        if (status == AnimationStatus.dismissed) {
          navigator.pop();
          widget.onDismissed.call();
        }
      });

    if (mounted) {
      animationController!.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: widget.hideOutAnimationDuration * 1.5,
      curve: Curves.linearToEaseOut,
      top: topPosition,
      left: widget.leftPadding,
      right: widget.rightPadding,
      child: SlideTransition(
        position: offsetAnimation as Animation<Offset>,
        child: SafeArea(
          child: TapBounceContainer(
            onTap: () {
              if (mounted) {
                widget.onTap?.call();
                animationController!.reverse();
              }
            },
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
