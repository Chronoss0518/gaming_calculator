import 'package:flutter/material.dart';

class NumberPanel extends StatelessWidget
{
  NumberPanel(
    this.number,
    this.size,
    this.act,{
      super.key});

  final int number;
  final double size;
  final void Function() act;
  
  @override
  Widget build(BuildContext context) {
    final tmpSize = size * 0.8;
    return Container(
      width : size,
      height : size,
      decoration: BoxDecoration(border: Border.all(width:5)),
      child:Text(number.toString(),style:TextStyle(fontSize: tmpSize),textAlign: TextAlign.center,),
    );
  }
}