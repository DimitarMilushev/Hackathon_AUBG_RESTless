import 'package:flutter/material.dart';

class LoadableScreenWrapper extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const LoadableScreenWrapper({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(child);
    if (isLoading) {
      const modal = [
        Opacity(
          opacity: 0.3,
          child: ModalBarrier(dismissible: false, color: Colors.black),
        ),
        Center(child: CircularProgressIndicator())
      ];
      widgetList += modal;
    }
    return Stack(children: widgetList);
  }
}
