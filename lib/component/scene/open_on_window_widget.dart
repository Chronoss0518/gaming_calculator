import 'package:flutter/material.dart';

class OpenOnWindowWidget extends StatefulWidget
{

  OpenOnWindowWidget(this.child,{super.key});

  final Widget child;

  final _state = _OpneOnWindowWidgetState();

  Size getWindSize(BuildContext context) => MediaQuery.of(context).size;

  void setOnWidget(Widget onWindow){_state.setOnWidget(onWindow);}

  @override
  State<StatefulWidget> createState() => _state;

}

class _OpneOnWindowWidgetState extends State<OpenOnWindowWidget>
{
  void setOnWidget(Widget onWindow){setState((){this.onWindow = onWindow;});}

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      widget.child,
      Center(child: onWindow ?? Container()),
    ],);
  }
  Widget? onWindow;


}