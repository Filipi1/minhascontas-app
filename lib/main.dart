import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:minhascontas/android/pages/auth/auth.page.dart';
import 'package:minhascontas/android/pages/home/home.binding.dart';
import 'package:minhascontas/android/widgets/bottom-bar-navigator.widget.dart';
import 'package:minhascontas/styles/colors.theme.dart';

import 'android/pages/auth/auth.binding.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppThemeColors.primaryColor,
        primaryColorDark: AppThemeColors.primaryColor,
        brightness: Brightness.light,
        backgroundColor: AppThemeColors.backgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: AppThemeColors.backgroundColor,
          titleTextStyle: TextStyle(color: Colors.black)
        )
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => AuthPage(), binding: AuthBinding()),
        GetPage(name: "/root", page: () => BottomBarNavigator(), binding: HomeBinding())
      ],
    );
  }
}