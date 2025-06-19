import 'package:flutter/material.dart';
import 'package:gaming_calculator/component/base_component/on_window_base.dart';
import 'package:gaming_calculator/component/sub_window/open_on_window_widget.dart';

class SelectBoardType extends StatelessWidget
{
  SelectBoardType(this.displayWidget,{super.key});

  final OpenOnWindowWidget displayWidget;
  
  @override
  Widget build(BuildContext context) {
    return OnWindowBase(displayWidget,child: Container(color: Colors.blue,),);
  }
}