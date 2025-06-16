
import 'package:flutter/material.dart';

class OnWindowSizeBase extends StatelessWidget
{
  const OnWindowSizeBase(this.child,{super.key});

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(heightFactor: 0.8,widthFactor: 0.8,child: child);
  }

}