import 'package:ch_flutter_library/widget/base_state.dart';
import 'package:flutter/material.dart';
import 'package:gaming_calculator/model/application_model_manager.dart';

class DataPanelEditor extends StatefulWidget
{
  
  DataPanelEditor(
    this.dataPanelNo,{
      this.inversionFlg = false,
      this.displayCloseButtonFlg = true,
      super.key});

  final int dataPanelNo;
  final bool inversionFlg;
  final bool displayCloseButtonFlg;

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
    var data = appModelManager.getDataPanelData(widget.dataPanelNo);
    controller = TextEditingController(text: data?.nickName ?? "");
  }

  @override
  Widget build(BuildContext context) {
    var data = appModelManager.getDataPanelData(widget.dataPanelNo);

    var size = MediaQuery.of(context).size;

    double baseSize = size.width < size.height ? size.width : size.height;

    baseSize = baseSize * 0.01;

    return Container(
      width: size.width * 0.8,
      height: size.height,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(border: Border.all(width: 10,)),
      child:data != null ? 
      RotatedBox(
        quarterTurns: !widget.inversionFlg ? 0 : 2,
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
          Container(
            margin:EdgeInsets.all(1.0),
            child: Text(
              data.point.toString(),
              style: TextStyle(fontSize: pointTextSize * baseSize,),
              textAlign: TextAlign.left,),
          ),
        
        ],),
      ) : null,
    );
  }
}