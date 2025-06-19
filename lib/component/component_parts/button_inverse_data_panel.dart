import 'package:ch_flutter_library/widget/scene_manager.dart';
import 'package:flutter/material.dart';
import 'package:gaming_calculator/model/display_setting_data.dart';

const double ICON_OVER_SIZE = 10;

class ButtonInverseDataPanel extends StatelessWidget
{
  ButtonInverseDataPanel(this.displayScene,{this.baseSize,super.key});

  final BaseScene displayScene;
  final double? baseSize;

  @override
  Widget build(BuildContext context) {

    var tmpSize = baseSize;
    if(tmpSize != null)tmpSize = tmpSize + ICON_OVER_SIZE;
    return MaterialButton(
      onPressed: (){
        displayScene.setState((){
          var displaySetting = displayScene.getSaveData<DisplaySettingData>();
          displaySetting?.inversionFlg = !displaySetting.inversionFlg;
        });
      },
      child: Container(
        width: tmpSize,
        height: tmpSize,
        decoration: BoxDecoration(border: Border.all(width: 5.0)),
        child: Center(
          child: Icon(
            Icons.change_circle_outlined,size: baseSize,
          ),
        )
      )
    );
  }
}