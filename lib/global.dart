
import 'package:get/get.dart';

import 'common/services/http_service.dart';
import 'common/services/user_service.dart';
import 'common/util/storage.dart';

class Global {
  static Future<void> init() async {
    await Storage().init();
    // 初始化服务，Get.put 方式直接注入
    Get.put<HttpService>(HttpService());
    Get.put<UserService>(UserService());
    }
}