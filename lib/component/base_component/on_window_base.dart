
import 'package:flutter/material.dart';
import 'package:gaming_calculator/component/sub_window/open_on_window_widget.dart';

class OnWindowBase extends StatelessWidget
{
  const OnWindowBase(this.displayWidget,{this.child,super.key});

  final Widget? child;
  final OpenOnWindowWidget displayWidget;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.8,
      widthFactor: 0.8,
      child: Stack(
        children: [
          child?? Container(),
          MaterialButton(
            child:Icon(Icons.close),
            onPressed: displayWidget.closeOnWidget),
        ])
      );
  }

}