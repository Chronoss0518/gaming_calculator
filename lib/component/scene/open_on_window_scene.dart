
import 'package:ch_flutter_library/widget/scene_manager.dart';
import 'package:flutter/material.dart';

abstract class OpenOnWindowScene extends BaseScene
{
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      buildBase(context),
      Center(child: onWindow ?? Container()),
    ],);
  }

  Widget buildBase(BuildContext context);

  void setOnWidget(Widget onWindow){this.onWindow = onWindow;}

  Widget? onWindow;

}