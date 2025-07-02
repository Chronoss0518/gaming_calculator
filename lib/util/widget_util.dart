import 'package:ch_flutter_library/class/platform_manager.dart';
import 'package:flutter/material.dart';
import 'package:gaming_calculator/model/application_constant.dart';

final widgetUtil = WidgetUtility._internal();

class WidgetUtility
{
  WidgetUtility._internal();

  Size getAspectSize(BuildContext context)
  {
    final platform = PlatformManager(context);

    Size aspects = MediaQuery.of(context).size;
    final w = aspects.width / (platform.isWeb ? appConstants.displayBaseAspect.height : appConstants.displayBaseAspect.width);
    final h = aspects.height / (platform.isWeb ? appConstants.displayBaseAspect.width : appConstants.displayBaseAspect.height);
    final aspect = w < h ? w : h;
    Size res = platform.isWeb ? 
      Size(appConstants.displayBaseAspect.width * aspect , appConstants.displayBaseAspect.height * aspect):
      Size(appConstants.displayBaseAspect.height * aspect , appConstants.displayBaseAspect.width * aspect);
    return res;
  }
}