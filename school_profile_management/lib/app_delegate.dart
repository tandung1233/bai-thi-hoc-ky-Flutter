import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_profile_management/app_context.dart';
import 'package:school_profile_management/login.dart';

class AppDelegate extends StatefulWidget {
  const AppDelegate({Key? key}) : super(key: key);

  @override
  State<AppDelegate> createState() => _AppDelegateState();
}

class _AppDelegateState extends State<AppDelegate> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppContext.navigatorKey,
      home: const LoginScreen(),
    );
  }
}
