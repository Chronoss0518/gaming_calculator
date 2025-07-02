import 'package:flutter/material.dart';
import 'package:gaming_calculator/component/base_component/number_panel.dart';
import 'package:gaming_calculator/component/scene/member_board_scene_base.dart';
import 'package:gaming_calculator/model/application_model_manager.dart';

class PointEditor extends StatefulWidget
{

  PointEditor(
    this.baseSize,
    this.displayScene,
    this.dataPanelNo,{
      super.key});
  
  final double baseSize;
  final MemberBoardSceneBase displayScene;
  final int dataPanelNo;
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PointEditor>
{

  int value = 0;
  TextEditingController controller = TextEditingController(text:"0");

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    var tmpSize = (size.width < size.height ? size.width : size.height)   * 0.05;
    var data = appModelManager.getDataPanelData(widget.dataPanelNo);
    final setting = appModelManager.getUseSettingData();

    return Column(
      children: [
        Expanded(
          child: TextField(controller:controller,onChanged: (value) {
            this.value = int.tryParse(value) ?? 0;
          },
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          style:TextStyle(fontSize: tmpSize)),
        ),
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildButtons(context,'⤵',(){widget.displayScene.setState((){value = data?.calcPoint ?? 0 ;controller.text = value.toString();});}),
                  buildButtons(context,'÷2',(){widget.displayScene.setState((){value = (value.toDouble() / 2.0).toInt();controller.text = value.toString();});}),
                  buildButtons(context,'C',(){widget.displayScene.setState((){value = 0;controller.text = value.toString();});}),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildButtons(context,'+',(){widget.displayScene.setState((){data?.addPoint(value, setting); value = 0; controller.text = value.toString();});}),
                  buildButtons(context,'-',(){widget.displayScene.setState((){data?.subPoint(value, setting); value = 0; controller.text = value.toString();});}),
                  buildButtons(context,'=',(){widget.displayScene.setState((){data?.setPoint(value,setting); value = 0; controller.text = value.toString();});}),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildNumberPanels(context,1),
                  buildNumberPanels(context,2),
                  buildNumberPanels(context,3),
                ],    
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildNumberPanels(context,4),
                  buildNumberPanels(context,5),
                  buildNumberPanels(context,6),
                ],    
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildNumberPanels(context,7),
                  buildNumberPanels(context,8),
                  buildNumberPanels(context,9),
                ],    
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildNumberPanels(context,0),
                ],    
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildButtons(
    BuildContext context,
    String item,
    void Function() act)
  {
    return Container(
      decoration:BoxDecoration(border: Border.all()),
      child: MaterialButton(onPressed: act,
        child: Text(item,style : TextStyle(fontSize: widget.baseSize,),),
      ),
    );
  }

  Widget buildNumberPanels(BuildContext context,int num)
  {
    return NumberPanel(num, widget.baseSize, (){value *= 10; value += num; controller.text = value.toString();});
  }

}