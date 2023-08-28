import 'package:flutter/material.dart';

class LoadingStateWidget extends StatelessWidget {
  final Color? color;
  final double? height;
  const LoadingStateWidget({
    Key? key,
    this.color,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: color ?? Colors.white.withOpacity(0.6),
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
