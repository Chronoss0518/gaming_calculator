import 'package:ch_flutter_library/widget/scene_manager.dart';
import 'package:flutter/material.dart';
import 'package:gaming_calculator/component/component_parts/data_panel.dart';
import 'package:gaming_calculator/component/scene/open_on_window_widget.dart';
import 'package:gaming_calculator/model/application_model_manager.dart';

class MemberBoard2Scene extends BaseScene
{

  var appModelManager = ApplicationModelManager();

  @override
  Widget build(BuildContext context) {
    var baseWidget = OpenOnWindowWidget(DataPanel(0,baseSize: 12,width: 200,height: 200,));
    return baseWidget;
  }
}
