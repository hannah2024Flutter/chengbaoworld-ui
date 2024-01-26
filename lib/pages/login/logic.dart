import 'package:castleworld/common/api/user_api.dart';
import 'package:castleworld/common/routers/app_routes.dart';
import 'package:castleworld/common/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/model/user/user_model.dart';
import '../../common/util/loading.dart';
import '../../common/util/storage.dart';

class LoginLogic extends GetxController {
  final selectLoginType = ValueNotifier(0).obs;
  final isRead = ValueNotifier(false).obs;
  final codeCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final pwdCtrl = TextEditingController();

  void getCode() async {
    await UserApi.sendPhoneVerifyCode(type: 1, mobile: phoneCtrl.text);
  }


  void smsLogin() async {
    try {
      Loading.show();
      UserModel userModel = await UserApi.smsLogin(
          mobile: phoneCtrl.text, smsCode: codeCtrl.text);
      await UserService.to.setUserInfo(userModel.userInfo!);
      await UserService.to.setToken(userModel.token!);
      Loading.success();
      Get.toNamed(AppRoutes.main);
    }finally{
      Loading.dismiss();
    }
  }


  void passwordLogin() async {
    try {
      Loading.show();
      UserModel userModel = await UserApi.passwordLogin(
          mobile: phoneCtrl.text, password: pwdCtrl.text);
      await UserService.to.setUserInfo(userModel.userInfo!);
      await UserService.to.setToken(userModel.token!);
      Loading.success();
      Get.toNamed(AppRoutes.main);
    } finally {
      Loading.dismiss();
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    phoneCtrl.dispose();
    pwdCtrl.dispose();
    codeCtrl.dispose();
  }
}
