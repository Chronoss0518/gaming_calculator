import 'package:flutter/material.dart';
import 'package:gaming_calculator/component/scene/member_board_scene_base.dart';

const double ICON_SIZE_RATIO = 0.8;

class DataPanelEditorButtonBase extends StatelessWidget
{
  DataPanelEditorButtonBase(
    this.displayScene,
    this.baseSize,{
      super.key});

  final MemberBoardSceneBase displayScene;
  late void Function() act;
  late Widget childImage;
  final double baseSize;

  @override
  Widget build(BuildContext context) {

    return MaterialButton(
      onPressed: (){
        displayScene.setState(act);
      },
      child: Container(
        width: baseSize,
        height: baseSize,
        margin: EdgeInsets.only(top:5.0,bottom:5.0),
        decoration: BoxDecoration(border: Border.all(width: 5.0)),
        child: Center(
          child: childImage,
        )
      )
    );
  }
}

class DataPanelEditorButtons extends StatelessWidget
{
  const DataPanelEditorButtons(
    this.buttonList,
    this.inversFlg,{
      super.key});

  final List<DataPanelEditorButtonBase> buttonList;
  final bool inversFlg;

  @override
  Widget build(BuildContext context) {
    return  RotatedBox(
      quarterTurns:!inversFlg ? 0 : 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: buttonList,
      ),
    );
  }

}