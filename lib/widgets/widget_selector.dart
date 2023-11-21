import 'package:flutter/material.dart';
import '../shared/constants/enum.dart';

class WidgetSelector extends StatelessWidget {
  const WidgetSelector({required this.state, required this.widget, required this.errorMessage, super.key});

  final LoadState state;
  final Widget widget;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    if (state == LoadState.success) {
      return widget;
    }
    if (state == LoadState.error) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              errorMessage,
            )
          ],
        ),
      );
    }
    return const Center(child: CircularProgressIndicator());
  }
}
