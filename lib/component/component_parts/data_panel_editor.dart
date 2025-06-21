import 'package:flutter/material.dart';
import 'package:gaming_calculator/component/component_parts/button_inverse_data_panel.dart';
import 'package:gaming_calculator/component/scene/member_board_scene_base.dart';
import 'package:gaming_calculator/component/sub_window/open_on_window_widget.dart';
import 'package:gaming_calculator/model/application_model_manager.dart';

class DataPanelEditor extends StatefulWidget
{
  
  DataPanelEditor(
    this.dataPanelNo,
    this.sceneBase,{
      this.inversionFlg = false,
      this.displayCloseButtonFlg = true,
      super.key});
  
  final MemberBoardSceneBase sceneBase;
  final bool inversionFlg;
  final bool displayCloseButtonFlg;
  final int dataPanelNo;

  @override
  State<StatefulWidget> createState() => _DataPanelEditorState();

}

class _DataPanelEditorState extends State<DataPanelEditor>
{
  final appModelManager = ApplicationModelManager();

  static const double nickNameTextSize = 2.0; 
  static const double pointTextSize = 3.0; 

  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    var data = appModelManager.getDataPanelData(widget.dataPanelNo);
    controller = TextEditingController(text: data?.nickName ?? "");
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var tmpSize = size.width < size.height ? size.width:size.height;
    tmpSize = tmpSize * 0.1;

    var baseWidget = OpenOnWindowWidget(
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ButtonInverseDataPanel(widget.sceneBase,baseSize: tmpSize,),
          buildPanel(context,size),
          ButtonInverseDataPanel(widget.sceneBase,baseSize: tmpSize,),
        ],
      ));
    return baseWidget;
  }
  
  Widget buildPanel(BuildContext context,Size size) {
    var data = appModelManager.getDataPanelData(widget.dataPanelNo);

    double baseSize = size.width < size.height ? size.width : size.height;

    baseSize = baseSize * 0.05;

    return Container(
      width: size.width * 0.8,
      height: size.height * 0.9,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(border: Border.all(width: 10,)),
      child:data != null ? 
      Stack(
        alignment: Alignment.topLeft,
        children: [
          RotatedBox(
            quarterTurns:!widget.inversionFlg ? 0 : 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Container(
                margin:EdgeInsets.all(1.0),
                child: TextField(
                  controller: controller,
                  onEditingComplete: () {
                    data.setNickName(controller.text);
                  },
                  style: TextStyle(fontSize: nickNameTextSize * baseSize),
                  textAlign: TextAlign.left)),
              Row(
                children: [
                  Container(
                    margin:EdgeInsets.all(1.0),
                    child: Text(
                      data.point.toString(),
                      style: TextStyle(fontSize: pointTextSize * baseSize,),
                      textAlign: TextAlign.left,),
                  ),
                ],
              ),
            
            ],),
          ),
        ],
      ) : null,
    );
  }
}