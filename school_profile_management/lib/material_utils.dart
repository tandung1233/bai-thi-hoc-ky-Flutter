import 'dart:ui' as ui;

import 'package:flutter_screenutil/flutter_screenutil.dart';

class MaterialUtils {
  static double screenWidth() {
    return ui.window.physicalSize.width / ui.window.devicePixelRatio;
  }

  static double screenHeight() {
    return ui.window.physicalSize.height / ui.window.devicePixelRatio;
  }

  static double? titleFontSize() {
    return 18.sp;
  }

  static double? normalFontSize() {
    return 14.sp;
  }

  static double? descriptionFontSize() {
    return 12.sp;
  }
}
