import 'package:flutter/material.dart';
import 'package:gaming_calculator/model/application_model_manager.dart';

class DataPanel extends StatelessWidget
{
  DataPanel(this._dataPanelNo,{super.key});

  final int _dataPanelNo;
  
  final appModelManager = ApplicationModelManager();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}