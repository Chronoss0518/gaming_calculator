
import 'package:gaming_calculator/model/player_data.dart';
import 'package:gaming_calculator/model/setting_data.dart';

class ApplicationModelManager
{
  ApplicationModelManager._internal();
  static final ApplicationModelManager instance = ApplicationModelManager._internal();
  factory ApplicationModelManager() => instance;

  void init(){

  }

  void initPlayerData(int playerDataCount){
    if(playerDataCount <= 0)return;
    _playerDatas.length = playerDataCount;
  }

  void addSettingData(String settingName,String description){
    var tmp = SettingData();
    tmp.name = settingName;
    tmp.description = description;
    _settingDatas.add(tmp);
  }

  void addPlayerData(String name){
    var tmp = PlayerData();
    tmp.setNickName(name);
    _playerDatas.add(tmp);
  }

  void setUseSettingData(int num){
    _useSetting = _isOutRangeValue(num,_settingDatas.length) ?
    _defaultSetting :
    _settingDatas[num];
  }

  SettingData getUseSettingData(){
    _useSetting ??= _defaultSetting;
    return _useSetting!;
  }

  SettingData getSettingData(int num){
    if(_isOutRangeValue(num,_settingDatas.length))return SettingData();
    _useSetting ??= _defaultSetting;
    return _useSetting!;
  }

  get getPlayerDataCount => _playerDatas.length;

  PlayerData getPlayerData(int num){
    return _isOutRangeValue(num,_playerDatas.length) ?
    _playerDatas[num] :
    _playerDatas[0];
  }

  bool _isOutRangeValue(int num,int targetListLength){
    return (num < 0 || num >= targetListLength);
  }

  final List<SettingData> _settingDatas = <SettingData>[];
  SettingData? _useSetting;
  final List<PlayerData> _playerDatas = <PlayerData>[];

  final SettingData _defaultSetting = SettingData.createInit(
    maxPoint: 99990000,
    minPoint: 0,
    maxCount: 99); 
}