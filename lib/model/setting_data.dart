class SettingData
{
  String settingDataName = "";

  get maxPoint => _maxPoint;
  get minPoint => _minPoint;
  get maxCount => _maxCount;
  
  void setMaxPoint(int point)
  {
    if(_minPoint >= point)return;
    _maxPoint = point;
  }

  void setMinPoint(int point)
  {
    if(_maxPoint <= point)return;
    _minPoint = point;
  }

  void setMaxCount(int count)
  {
    if(count < 0)return;
    _maxCount = count;
  }

//Private Member//

  int _maxPoint = 0;
  int _minPoint = 0;
  int _maxCount = 0;


}