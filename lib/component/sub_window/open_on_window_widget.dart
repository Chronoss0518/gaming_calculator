import 'package:flutter/material.dart';

class OpenOnWindowWidget extends StatefulWidget
{
  OpenOnWindowWidget(this.child,{super.key});

  final Widget child;

  final _state = _OpneOnWindowWidgetState();

  Size getWindSize(BuildContext context) => MediaQuery.of(context).size;
  
  void closeOnWidget(){_state.closeOnWidget();}

  void setOnWidget(Widget onWindow){_state.setOnWidget(onWindow);}

  @override
  State<StatefulWidget> createState() => _state;

}

class _OpneOnWindowWidgetState extends State<OpenOnWindowWidget>
{
  void setOnWidget(Widget onWindow){setState((){_onWindow = onWindow;});}

  void closeOnWidget(){_onWindow = null;}

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      widget.child,
      Center(child: _onWindow ?? Container()),
    ],);
  }
  Widget? _onWindow;


}