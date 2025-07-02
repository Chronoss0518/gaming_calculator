import 'package:gaming_calculator/model/data_panel_data.dart';
import 'package:gaming_calculator/model/data_panel_setting_data.dart';

final appModelManager = _ApplicationModelManager._internal();

class _ApplicationModelManager
{
  _ApplicationModelManager._internal();

  void init(){

  }

  void initDataPanelData(int dataPanelDataCount){
    if(dataPanelDataCount <= 0)return;
    _dataPanelDatas.length = dataPanelDataCount;
  }

  void addSettingData(String settingName,String description){
    var tmp = DataPanelSettingData();
    tmp.name = settingName;
    tmp.description = description;
    _settingDatas.add(tmp);
  }

  void addDataPanelData(String name){
    var tmp = DataPanelData();
    tmp.setNickName(name);
    _dataPanelDatas.add(tmp);
  }

  void setUseSettingData(int num){
    _useSetting = _isRangeValue(num,_settingDatas.length) ?
    _settingDatas[num] :
    _defaultSetting;
  }

  DataPanelSettingData getUseSettingData(){
    _useSetting ??= _defaultSetting;
    return _useSetting!;
  }

  void setSettingData(int num){
    if(_isRangeValue(num,_settingDatas.length))return;
    _useSetting = _settingDatas[num];
  }

  get getDataPanelDataCount => _dataPanelDatas.length;

  DataPanelData? getDataPanelData(int num){
    return _isRangeValue(num,_dataPanelDatas.length) ?
    _dataPanelDatas[num] :
    null ;
  }

  bool _isRangeValue(int num,int targetListLength){
    return (num >= 0 && num < targetListLength);
  }

  final List<DataPanelSettingData> _settingDatas = <DataPanelSettingData>[];
  DataPanelSettingData? _useSetting;
  final List<DataPanelData> _dataPanelDatas = <DataPanelData>[];

  final DataPanelSettingData _defaultSetting = DataPanelSettingData.createInit(
    maxPoint: 99990000,
    minPoint: 0,
    maxCount: 99); 
}