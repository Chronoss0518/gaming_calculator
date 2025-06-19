import 'package:flutter/material.dart';
import 'package:gaming_calculator/model/application_model_manager.dart';

class DataPanel extends StatelessWidget
{
  DataPanel(
    this.dataPanelNo,
    {this.baseSize = 12,
      this.width,
      this.height,
      super.key});

  final int dataPanelNo;
  final double baseSize;
  final double? width;
  final double? height;


  static const double nickNameTextSize = 2.0; 
  static const double pointTextSize = 3.0; 
  
  final appModelManager = ApplicationModelManager();

  @override
  Widget build(BuildContext context) {
    var playerData = appModelManager.getPlayerData(dataPanelNo);

    return Container(
      padding: EdgeInsets.all(10.0),
      width: width,
      height: height,
      decoration: BoxDecoration(border: Border.all(width: 10,)),
      child:playerData != null ? 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
          margin:EdgeInsets.all(1.0),
          child: Text(
            playerData.nickName,
            style: TextStyle(fontSize: nickNameTextSize * baseSize),
            textAlign: TextAlign.left)),
        Container(
          margin:EdgeInsets.all(1.0),
          child: Text(
            playerData.point.toString(),
            style: TextStyle(fontSize: pointTextSize * baseSize,),
            textAlign: TextAlign.left,),
        ),

      ],) : null,
    );
  }
}