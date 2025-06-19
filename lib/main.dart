import 'package:flutter/material.dart';
import 'package:ch_flutter_library/widget/scene_manager.dart';
import 'package:gaming_calculator/component/scene/member_board_2_scene.dart';
import 'package:gaming_calculator/component/scene/start_scene.dart';
import 'package:gaming_calculator/model/application_model_manager.dart';

late SceneManager _sceneManager; 

void main() {
  _sceneManager = SceneManager(MemberBoard2Scene());
  var appModelManager = ApplicationModelManager();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: _sceneManager,
    );
  }
}
