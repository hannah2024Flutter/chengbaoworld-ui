
import 'package:castleworld/common/util/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/services/http_service.dart';
import 'common/services/user_service.dart';
import 'common/util/storage.dart';

class Global {
  static Future<void> init() async {
    WidgetsBinding widgetsBinding =
    WidgetsFlutterBinding.ensureInitialized();// 等待Flutter初始化完成
    await Storage().init();
    Loading();
    // 初始化服务，Get.put 方式直接注入
    Get.put<HttpService>(HttpService());
    Get.put<UserService>(UserService());
    }
}