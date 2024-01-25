import 'dart:convert';
import 'package:get/get.dart';
import '../model/user/user_model.dart';
import '../util/storage.dart';

class UserService extends GetxService{
  static UserService get to => Get.find();

  final _isLogin = false.obs;
  String token = '';
  final _userInfo = UserInfo().obs;

  /// 是否登录
  bool get isLogin => _isLogin.value;

  /// 用户 profile
  UserInfo get userInfo => _userInfo.value;

  /// 是否有令牌 token
  bool get hasToken => token.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    // 读 token
    token = Storage().getString(Constants.storageToken);
    // 读 profile
    var userInfoOffline = Storage().getString(Constants.storageUserInfo);
    if (userInfoOffline.isNotEmpty) {
      _userInfo(UserInfo.fromJson(jsonDecode(userInfoOffline)));
    }
  }

  /// 设置令牌
  Future<void> setToken(String value) async {
    await Storage().setString(Constants.storageToken, value);
    token = value;
  }

  /// 获取用户 profile
  // Future<void> getUserInfo() async {
  //   if (token.isEmpty) return;
  //   UserInfo result = await UserApi.;
  //   _userInfo(result);
  //   _isLogin.value = true;
  //   Storage().setString(Constants.storageUserInfo, jsonEncode(result));
  // }

  /// 设置用户 profile
  Future<void> setUserInfo(UserInfo userInfo) async {
    if (token.isEmpty) return;
    _isLogin.value = true;
    _userInfo(userInfo);
    Storage().setString(Constants.storageUserInfo, jsonEncode(userInfo));
  }

  /// 注销
  Future<void> logout() async {
    // if (_isLogin.value) await UserAPIs.logout();
    await Storage().remove(Constants.storageToken);
    _userInfo(UserInfo());
    _isLogin.value = false;
    token = '';
  }

  /// 检查是否登录
  Future<bool> checkIsLogin() async {
    if (_isLogin.value == false) {
      await Get.toNamed(RouteNames.main);
      return false;
    }
    return true;
  }

}