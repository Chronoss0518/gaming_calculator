import 'package:flutter/material.dart';
import 'package:gaming_calculator/component/component_parts/data_panel_editor_buttons.dart';
import 'package:gaming_calculator/model/display_setting_data.dart';

class ButtonInverseDataPanel extends DataPanelEditorButtonBase
{
  ButtonInverseDataPanel(
    super.displayScene,
    super.baseSize,{
      super.key})
  {
    super.act = (){
          var displaySetting = displayScene.getSaveData<DisplaySettingData>();
          displaySetting?.inversionFlg = !displaySetting.inversionFlg;
        };
    
    final tmpSize = baseSize * ICON_SIZE_RATIO;
    super.childImage = Icon(Icons.change_circle_outlined,size: tmpSize,);
  }
}