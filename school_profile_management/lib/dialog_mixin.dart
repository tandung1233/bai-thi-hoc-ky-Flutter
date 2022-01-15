import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_profile_management/app_context.dart';
import 'package:school_profile_management/c_button.dart';
import 'package:school_profile_management/c_text.dart';
import 'package:school_profile_management/int_extension.dart';
import 'package:school_profile_management/material_utils.dart';

mixin DialogsMixin {
  var context = AppContext.navigatorKey.currentContext!;
  void dissmissAlertDialog() {
    Navigator.of(context, rootNavigator: true).pop('dialog');
  }

  showAlertDialog(String title, String message, String buttonTitle,
      VoidCallback? onPressed) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.center,
          child: IntrinsicHeight(
            child: Container(
              width: MaterialUtils.screenWidth() * 0.9,
              child: Column(
                children: [
                  (MaterialUtils.screenHeight() ~/ 35).height,
                  (MaterialUtils.screenHeight() ~/ 35).height,
                  CText(
                    text: title.toUpperCase(),
                    textColor: const Color(0xFF6C6A6A),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  (MaterialUtils.screenHeight() ~/ 35).height,
                  CText(
                    textAlign: TextAlign.center,
                    pin: EdgeInsets.symmetric(
                        horizontal: MaterialUtils.screenWidth() / 9),
                    text: message,
                    lineSpacing: 1.2,
                    textColor: const Color(0xFF098a8f),
                    fontSize: 13.sp,
                  ),
                  (MaterialUtils.screenHeight() ~/ 35).height,
                  Container(
                    height: 0.5,
                    color: Colors.grey,
                  ),
                  (MaterialUtils.screenHeight() ~/ 35).height,
                  CButton(
                    radius: 10,
                    height: 48.h,
                    width: MaterialUtils.screenWidth() / 4,
                    backgroundColor: const Color(0xFF098a8f),
                    title: 'ok'.tr().toUpperCase(),
                    titleFontSize: 12.sp,
                    titleColor: Colors.white,
                    buttonTapped: onPressed ??
                        () {
                          Navigator.of(context, rootNavigator: true)
                              .pop('dialog');
                        },
                  ),
                  (MaterialUtils.screenHeight() ~/ 35).height,
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim),
          child: child,
        );
      },
    );
  }

  void dissmissPopup() {
    Navigator.of(context, rootNavigator: true).pop('dialog');
  }

  showAlertOptionsDialog(String title, String message,
      VoidCallback? onPressedAgree, VoidCallback? onPressCancel) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.center,
          child: IntrinsicHeight(
            child: Container(
              width: MaterialUtils.screenWidth() * 0.9,
              child: Column(
                children: [
                  (MaterialUtils.screenHeight() ~/ 35).height,
                  (MaterialUtils.screenHeight() ~/ 35).height,
                  CText(
                    text: title.toUpperCase(),
                    textColor: const Color(0xFF6C6A6A),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  (MaterialUtils.screenHeight() ~/ 35).height,
                  CText(
                    textAlign: TextAlign.center,
                    pin: EdgeInsets.symmetric(
                        horizontal: MaterialUtils.screenWidth() / 9),
                    text: message,
                    lineSpacing: 1.2,
                    textColor: const Color(0xFF098a8f),
                    fontSize: 13.sp,
                  ),
                  (MaterialUtils.screenHeight() ~/ 35).height,
                  Container(
                    height: 0.5,
                    color: Colors.grey,
                  ),
                  (MaterialUtils.screenHeight() ~/ 35).height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CButton(
                        borderColor: const Color(0xFF098a8f),
                        radius: 10,
                        height: 48.h,
                        width: MaterialUtils.screenWidth() / 4,
                        backgroundColor: Colors.white,
                        title: 'Hủy bỏ'.tr().toUpperCase(),
                        titleFontSize: 12.sp,
                        titleColor: const Color(0xFF098a8f),
                        buttonTapped: onPressCancel ??
                            () {
                              Navigator.of(context, rootNavigator: true)
                                  .pop('dialog');
                            },
                      ),
                      16.width,
                      CButton(
                        radius: 10,
                        height: 48.h,
                        width: MaterialUtils.screenWidth() / 4,
                        backgroundColor: const Color(0xFF098a8f),
                        title: 'Đồng ý'.tr().toUpperCase(),
                        titleFontSize: 12.sp,
                        titleColor: Colors.white,
                        buttonTapped: onPressedAgree ??
                            () {
                              Navigator.of(context, rootNavigator: true)
                                  .pop('dialog');
                            },
                      ),
                    ],
                  ),
                  (MaterialUtils.screenHeight() ~/ 35).height,
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim),
          child: child,
        );
      },
    );
  }

  showAddNewProfile(String title, String message, VoidCallback? onPressedAgree,
      VoidCallback? onPressCancel) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.center,
          child: IntrinsicHeight(
            child: Container(
              width: MaterialUtils.screenWidth() * 0.9,
              child: Column(
                children: [
                  (MaterialUtils.screenHeight() ~/ 35).height,
                  (MaterialUtils.screenHeight() ~/ 35).height,
                  CText(
                    text: title.toUpperCase(),
                    textColor: const Color(0xFF6C6A6A),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  (MaterialUtils.screenHeight() ~/ 35).height,
                  CText(
                    textAlign: TextAlign.center,
                    pin: EdgeInsets.symmetric(
                        horizontal: MaterialUtils.screenWidth() / 9),
                    text: message,
                    lineSpacing: 1.2,
                    textColor: const Color(0xFF098a8f),
                    fontSize: 13.sp,
                  ),
                  (MaterialUtils.screenHeight() ~/ 35).height,
                  Container(
                    height: 0.5,
                    color: Colors.grey,
                  ),
                  (MaterialUtils.screenHeight() ~/ 35).height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CButton(
                        borderColor: const Color(0xFF098a8f),
                        radius: 10,
                        height: MaterialUtils.screenHeight() / 26,
                        width: MaterialUtils.screenWidth() / 4,
                        backgroundColor: Colors.white,
                        title: 'Hủy bỏ'.tr().toUpperCase(),
                        titleFontSize: 12.sp,
                        titleColor: const Color(0xFF098a8f),
                        buttonTapped: onPressCancel ??
                            () {
                              Navigator.of(context, rootNavigator: true)
                                  .pop('dialog');
                            },
                      ),
                      16.width,
                      CButton(
                        radius: 10,
                        height: MaterialUtils.screenHeight() / 26,
                        width: MaterialUtils.screenWidth() / 4,
                        backgroundColor: const Color(0xFF098a8f),
                        title: 'Đồng ý'.tr().toUpperCase(),
                        titleFontSize: 12.sp,
                        titleColor: Colors.white,
                        buttonTapped: onPressedAgree ??
                            () {
                              Navigator.of(context, rootNavigator: true)
                                  .pop('dialog');
                            },
                      ),
                    ],
                  ),
                  (MaterialUtils.screenHeight() ~/ 35).height,
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim),
          child: child,
        );
      },
    );
  }
}
