import 'package:flutter/material.dart';
import 'package:gaming_calculator/component/scene/member_board_scene_base.dart';
import 'package:gaming_calculator/model/display_setting_data.dart';

const double ICON_OVER_SIZE = 10;

class ButtonInverseDataPanel extends StatelessWidget
{
  ButtonInverseDataPanel(this.displayScene,{this.baseSize,super.key});

  final MemberBoardSceneBase displayScene;
  final double? baseSize;

  @override
  Widget build(BuildContext context) {

    var tmpSize = baseSize;
    if(tmpSize != null)tmpSize = tmpSize - ICON_OVER_SIZE;
    return MaterialButton(
      onPressed: (){
        displayScene.setState((){
          var displaySetting = displayScene.getSaveData<DisplaySettingData>();
          displaySetting?.inversionFlg = !displaySetting.inversionFlg;
        });
      },
      child: Container(
        width: baseSize,
        height: baseSize,
        margin: EdgeInsets.only(top:5.0,bottom:5.0),
        decoration: BoxDecoration(border: Border.all(width: 5.0)),
        child: Center(
          child: Icon(
            Icons.change_circle_outlined,size: tmpSize,
          ),
        )
      )
    );
  }
}