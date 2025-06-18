
import 'package:ch_flutter_library/widget/scene_manager.dart';
import 'package:flutter/material.dart';
import 'package:gaming_calculator/component/component_parts/select_board_type.dart';
import 'package:gaming_calculator/component/scene/open_on_window_scene.dart';


class StartScene extends OpenOnWindowScene
{
  @override
  Widget buildBase(BuildContext context)
  {
    setOnWidget(SelectBoardType());
    return Container();
  }
}
