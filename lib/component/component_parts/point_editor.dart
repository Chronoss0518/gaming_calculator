import 'package:flutter/material.dart';
import 'package:gaming_calculator/component/base_component/number_panel.dart';
import 'package:gaming_calculator/component/scene/member_board_scene_base.dart';

class PointEditor extends StatefulWidget
{

  PointEditor(this.displayScene,{super.key});
    
  final MemberBoardSceneBase displayScene;
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
          flex: 5,
          child: AspectRatio(
            aspectRatio: 0.7,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              
              itemBuilder: (context,count){
                return NumberPanel((count + 1) % 10, tmpSize, (){
                  widget.displayScene.setState((){value *= 10;value += (count + 1) % 10;});
                });
              },
              itemCount: 10,
            ),
          ),
        )
      ],
    );
  }
}