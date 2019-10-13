import 'package:devfest_demo/config/index.dart';
import 'package:devfest_demo/utils/devfest.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

//to do all the work assrynously
Future<void>main()async{
  //we want to make the status bar to be transparent
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  //setting prefered orientation(landscape or portrait)
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,DeviceOrientation.portraitUp
  ]);

  Devfest.prefs=await SharedPreferences.getInstance();

  runApp(ConfigPage());
}
