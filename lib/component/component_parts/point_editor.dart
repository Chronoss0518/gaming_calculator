import 'package:flutter/material.dart';

class PointEditor extends StatelessWidget
{

    PointEditor({this.ratio = 0,super.key});
    
    final double ratio;
    @override
    Widget build(BuildContext context) {
        return Container(
            width: 10,
            height: 10,
        );
    }
}