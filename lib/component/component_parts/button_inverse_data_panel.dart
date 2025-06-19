import 'package:ch_flutter_library/widget/scene_manager.dart';
import 'package:flutter/material.dart';
import 'package:gaming_calculator/model/display_setting_data.dart';

class ButtonInverseDataPanel extends StatelessWidget
{
  ButtonInverseDataPanel(this.displayScene,{super.key});

  final BaseScene displayScene;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: (){
        //var displaySetting = displayScene.getSaveData<DisplaySettingData>();
      },
      child: Container());
  }
}