
import 'package:ch_flutter_library/widget/scene_manager.dart';
import 'package:flutter/material.dart';
import 'package:gaming_calculator/component/base_component/on_window_size_base.dart';
import 'package:gaming_calculator/component/component_parts/data_panel.dart';
import 'package:gaming_calculator/component/component_parts/select_board_type.dart';
import 'package:gaming_calculator/component/scene/open_on_window_widget.dart';


class StartScene extends BaseScene
{
  @override
  Widget build(BuildContext context)
  {
    var baseWidget = OpenOnWindowWidget(DataPanel(0,baseSize: 12,width: 200,height: 200,));
    baseWidget.setOnWidget(SelectBoardType());
    return baseWidget;
  }
}
