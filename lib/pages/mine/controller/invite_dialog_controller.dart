import 'package:castleworld/common/util/loading.dart';
import 'package:get/get.dart';

/// 创建时间：2024/1/27
/// 作者：hannah
/// 描述：

class InviteDialogController extends GetxController {
  RxString superId = ''.obs;
  RxBool isRead = false.obs;

  @override
  void onInit() {
    super.onInit();
    superId.value = '';
    isRead.value = false;
  }

  saveData() {
    if (superId.isEmpty) {
      Loading.toast("请输入上级ID");
      return;
    }
    if (!isRead.value) {
      Loading.toast("请阅读并勾选好友协议");
      return;
    }

    ///TODO
  }
}
