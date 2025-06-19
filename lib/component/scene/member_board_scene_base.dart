import 'package:ch_flutter_library/widget/scene_manager.dart';
import 'package:gaming_calculator/model/display_setting_data.dart';

abstract class MemberBoardSceneBase extends BaseScene
{
  @override
  void init({SaveData? sendData}) {
    super.init(sendData: sendData);
    var tmp = DisplaySettingData();
    tmp.inversionFlg = false;
    setSaveData(tmp);
  }

}