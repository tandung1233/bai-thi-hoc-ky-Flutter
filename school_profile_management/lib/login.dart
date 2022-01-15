import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_profile_management/c_button.dart';
import 'package:school_profile_management/c_text.dart';
import 'package:school_profile_management/home.dart';
import 'package:school_profile_management/int_extension.dart';
import 'package:school_profile_management/material_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  (MaterialUtils.screenHeight() ~/ 8).height,
                  Image.asset(
                    'assets/login_banner.png',
                    width: 150.w,
                    height: 180.h,
                    fit: BoxFit.fill,
                  ),
                  32.h.toInt().height,
                  const TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tên đăng nhập',
                        hintText: 'Nhập tên đăng nhập'),
                  ),
                  12.h.toInt().height,
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Mật khẩu',
                        hintText: 'Nhập mật khẩu'),
                  ),
                  32.h.toInt().height,
                  CButton(
                    width: double.infinity,
                    height: 56.h,
                    radius: 10,
                    title: 'Đăng nhập',
                    titleFontSize: 16.sp,
                    titleFontWeight: FontWeight.bold,
                    titleColor: Colors.white,
                    backgroundColor: const Color(0xFF098a8f),
                    buttonTapped: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
