import 'package:castleworld/common/util/loading.dart';
import 'package:get/get.dart';

/// 创建时间：2024/1/27
/// 作者：hannah
/// 描述：

class MySocialInfoDialogController extends GetxController {
  RxString wxNum = ''.obs;
  RxString qqNum = ''.obs;
  RxBool isOpenMe = false.obs;
  RxBool isOpenFriend = false.obs;

  @override
  void onInit() {
    super.onInit();
    wxNum.value = '';
    qqNum.value = '';
    isOpenMe.value = false;
    isOpenFriend.value = false;
  }

  saveData() {
    if (wxNum.isEmpty) {
      Loading.toast("请输入微信号");
      return;
    }
    if (qqNum.isEmpty) {
      Loading.toast("请输入QQ号");
      return;
    }

    ///TODO
  }
}
