import 'package:ch_flutter_library/widget/scene_manager.dart';
import 'package:flutter/material.dart';
import 'package:gaming_calculator/component/component_parts/button_inverse_data_panel.dart';
import 'package:gaming_calculator/component/component_parts/data_panel.dart';
import 'package:gaming_calculator/component/scene/member_board_scene_base.dart';
import 'package:gaming_calculator/component/sub_window/open_on_window_widget.dart';
import 'package:gaming_calculator/model/application_model_manager.dart';
import 'package:gaming_calculator/model/display_setting_data.dart';

class MemberBoard2Scene extends MemberBoardSceneBase
{

  @override
  void init({SaveData? sendData}) {
    super.init(sendData: sendData);
    appModelManager.initDataPanelData(0);
    appModelManager.addDataPanelData("Test1");
    appModelManager.addDataPanelData("Test2");
  }

  @override
  Widget build(BuildContext context) {
    var displaySetting = getSaveData<DisplaySettingData>();
    var baseWidget = OpenOnWindowWidget(
      Row(
        children: [
          DataPanel(0,
          inversionFlg: displaySetting?.inversionFlg ?? false,
          baseSize: 12,
          width: 200,
          height: 200,),
          ButtonInverseDataPanel(this,baseSize: 64.0,),
          DataPanel(1,
          inversionFlg: displaySetting?.inversionFlg ?? false,
          baseSize: 12,
          width: 200,
          height: 200,),
        ],
      ));
    return baseWidget;
  }
}
