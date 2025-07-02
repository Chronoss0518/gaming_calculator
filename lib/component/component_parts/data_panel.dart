import 'package:flutter/material.dart';
import 'package:gaming_calculator/model/application_model_manager.dart';

class DataPanel extends StatelessWidget
{
  DataPanel(
    this.dataPanelNo,{
      this.baseSize = 12,
      this.inversionFlg = false,
      this.width,
      this.height,
      super.key});

  final int dataPanelNo;
  final double baseSize;
  final bool inversionFlg;
  final double? width;
  final double? height;

  static const double nickNameTextSize = 2.0; 
  static const double pointTextSize = 3.0; 
  
  @override
  Widget build(BuildContext context) {
    var data = appModelManager.getDataPanelData(dataPanelNo);

    return Container(
      padding: EdgeInsets.all(10.0),
      width: width,
      height: height,
      decoration: BoxDecoration(border: Border.all(width: 10,)),
      child:data != null ? 
      RotatedBox(
        quarterTurns: !inversionFlg ? 0 : 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Container(
            margin:EdgeInsets.all(1.0),
            child: Text(
              data.nickName,
              style: TextStyle(fontSize: nickNameTextSize * baseSize),
              textAlign: TextAlign.left)),
          Container(
            margin:EdgeInsets.all(1.0),
            child: Text(
              data.viewPoint.toString(),
              style: TextStyle(fontSize: pointTextSize * baseSize,),
              textAlign: TextAlign.left,),
          ),
        
        ],),
      ) : null,
    );
  }
}