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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Text(value.toString()),
        ),
        Expanded(
          child: Text(value.toString()),
        ),
        Expanded(
          flex: 3,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context,count){
              return NumberPanel((count + 1) % 10, 10, (){
                widget.displayScene.setState((){value *= 10;value += (count + 1) % 10;});
              });
            },
            itemCount: 10,
          ),
        )
      ],
    );
  }
}