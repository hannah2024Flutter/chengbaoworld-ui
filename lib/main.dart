import 'package:castleworld/common/routers/app_pages.dart';
import 'package:castleworld/common/routers/app_routes.dart';
import 'package:castleworld/pages/app_home/app_home.dart';
import 'package:castleworld/pages/login/login.dart';
import 'package:castleworld/pages/product_detail/product_detail.dart';
import 'package:flutter/services.dart';
import 'package:castleworld/pages/product_detail/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'common/services/http_service.dart';
import 'common/services/user_service.dart';
import 'common/util/storage.dart';
import 'global.dart';
import 'pages/search/search.dart';

void main() async{
  await Global.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    return GetMaterialApp(
      title: '城堡世界',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0E8AFD)),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Colors.black,
            selectedLabelStyle: TextStyle(fontSize: 9),
            unselectedItemColor: Colors.black,
            unselectedLabelStyle: TextStyle(fontSize: 9)),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.login,
      getPages: AppPages.routes,
      builder: (context, widget) {
        widget = EasyLoading.init()(context, widget); // EasyLoading 初始化

        // 不随系统字体缩放比例
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: widget,
        );
      },
      // home: AppHome(),
    );
  }
}
