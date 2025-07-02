import 'package:flutter/material.dart';
import 'package:gaming_calculator/component/base_component/number_panel.dart';
import 'package:gaming_calculator/component/scene/member_board_scene_base.dart';
import 'package:gaming_calculator/model/application_model_manager.dart';

class PointEditor extends StatefulWidget
{

  PointEditor(
    this.displayScene,
    this.dataPanelNo,{
      super.key});
    
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
            controller.text = this.value.toString();
          },
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          style:TextStyle(fontSize: tmpSize)),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              buildButtons(context,'⤵',(){widget.displayScene.setState((){value = data?.calcPoint ?? 0 ;controller.text = value.toString();});}),
              buildButtons(context,'÷2',(){widget.displayScene.setState((){value = (value.toDouble() / 2.0).toInt();controller.text = value.toString();});}),
              buildButtons(context,'+',(){widget.displayScene.setState((){data?.addPoint(value, setting); value = 0; controller.text = value.toString();});}),
              buildButtons(context,'-',(){widget.displayScene.setState((){data?.subPoint(value, setting); value = 0; controller.text = value.toString();});}),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: AspectRatio(
            aspectRatio: 0.7,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              
              itemBuilder: (context,count){
                return NumberPanel((count + 1) % 10, tmpSize, (){
                  widget.displayScene.setState((){value *= 10;value += (count + 1) % 10;});
                  controller.text = value.toString();
                });
              },
              itemCount: 10,
            ),
          ),
        )
      ],
    );
  }

  Widget buildButtons(
    BuildContext context,
    String item,
    void Function() act)
  {
    return Container(
      child: MaterialButton(onPressed: act,
      child: Text(item),
      ),
    );
  }

}