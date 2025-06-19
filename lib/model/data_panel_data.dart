import 'package:flutter/material.dart';
import 'package:gaming_calculator/model/data_panel_setting_data.dart';

class CounterData
{
  int count = 0;
  String name = "";
}

class DataPanelData
{
  Color? color;
  Color? lineColor;

  get point => _point;
  get nickName => _nickName;

  void addPoint(int point,DataPanelSettingData setting){
    if(point <= 0)return;
    var tmp =  _point + point;
    _point = (setting.maxPoint > tmp) ?  tmp : setting.minPoint;
  }
  
  void subPoint(int point,DataPanelSettingData setting){
    if(point <= 0)return;
    var tmp = _point - point;
    _point = (setting.minPoint < tmp) ?  tmp : setting.minPoint;
  }

  void setNickName(String name){
    _nickName = name;
  }

  void addCounterData(String name){
    if(_counter.containsKey(name))return;
    _counter[name] = 0;
  }

  void removeCounterData(String name){
    if(_counter.containsKey(name))return;
    _counter.remove(name);
  }

  void addCounter(String name,DataPanelSettingData setting){
    if(!_counter.containsKey(name))return;
    int val = _counter[name]!;
    int tmp = val + 1;
    _counter[name] = (setting.maxCount >= tmp) ?  tmp : setting.maxCount;

  }

  void subCounter(String name){
    if(!_counter.containsKey(name))return;
    int val = _counter[name]!;
    if(val <= 0)return;
    val -= 1;
    _counter[name] = val;
  }
  
  List<CounterData>getCounterList()
  {
    var res = <CounterData>[];
    for(var key in _counter.keys)
    {
      var tmp = CounterData();
      tmp.name = key;
      tmp.count = _counter[key]!;
      res.add(tmp);
    }

    return res;

  }
  
//Private Member//

  int _point = 0;
  String _nickName  = "";
  final Map<String,int> _counter = <String,int>{};
}