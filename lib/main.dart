import 'package:flutter/material.dart';
import 'package:ch_flutter_library/widget/scene_manager.dart';
import 'package:gaming_calculator/component/scene/member_board_1_scene.dart';
import 'package:gaming_calculator/component/scene/member_board_2_scene.dart';
import 'package:gaming_calculator/component/scene/start_scene.dart';
import 'package:gaming_calculator/model/application_constant.dart';
import 'package:gaming_calculator/model/application_model_manager.dart';

SceneManager _sceneManager
  = SceneManager(MemberBoard1Scene());
//  = SceneManager(MemberBoard2Scene());

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      //title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SafeArea(
        child: Center(
          child: _sceneManager,
        )
      ),
    );
  }
}
