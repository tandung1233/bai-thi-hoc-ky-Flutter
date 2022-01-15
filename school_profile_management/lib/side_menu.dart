import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_profile_management/c_text.dart';
import 'package:school_profile_management/dialog_mixin.dart';
import 'package:school_profile_management/int_extension.dart';
import 'package:school_profile_management/login.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> with DialogsMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          48.h.toInt().height,
          Center(
            child: Image.asset(
              'assets/login_banner.png',
              width: 150.w,
              height: 150.h,
              fit: BoxFit.fill,
            ),
          ),
          32.h.toInt().height,
          Divider(
            height: 1.h,
          ),
          24.h.toInt().height,
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Row(
              children: [
                Image.asset(
                  'assets/icon_app_info.png',
                  width: 16.w,
                  height: 16.w,
                ),
                12.w.toInt().width,
                CText(
                  text: 'Thông tin ứng dụng',
                  textColor: Color(0xff595959),
                  fontSize: 14.sp,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              showAlertOptionsDialog('Thông báo', 'Bạn có muốn đăng xuất?', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              }, () {
                dissmissAlertDialog();
              });
            },
            child: Padding(
              padding: EdgeInsets.only(left: 16.w, top: 24.h),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icon_logout.png',
                    width: 16.w,
                    height: 16.w,
                  ),
                  12.w.toInt().width,
                  CText(
                    text: 'Đăng xuất',
                    textColor: Color(0xff595959),
                    fontSize: 14.sp,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
