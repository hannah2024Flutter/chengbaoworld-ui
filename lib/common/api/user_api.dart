

import '../model/user/update_model.dart';
import '../model/user/user_model.dart';
import '../services/http_service.dart';

class UserApi {

  //产出总量
  static Future getMyWite()async{

  }

  //产出总量
  static Future getWitePrice()async{

  }



  ///发送短信验证码 1登录 2修改手机号 3修改密码 4注册
  static sendPhoneVerifyCode({
    required String mobile,
    required int type,
  }) async {
    await HttpService.to.post('/api/code/sendPhoneVerifyCode',
        data: {'mobile': mobile, 'type': type});
  }

  ///短信登录
  static Future<UserModel> smsLogin(
      {required String mobile, required String smsCode}) async {
    var res = await HttpService.to.post(
      'api/login/smsLogin',
      data: {'mobile': mobile, 'sms_code': smsCode},
    );
    return UserModel.fromJson(res);
  }

  /// 账号密码登录
  static Future<UserModel> passwordLogin(
      {required String mobile, required String password}) async {
    var res = await HttpService.to.post(
      '/api/login/passwordLogin',
      data: {'mobile': mobile, 'password': password},
    );
    return UserModel.fromJson(res);
  }


  //获取App 版本信息
  static Future getVersionConfig()async{
    var res = await HttpService.to.get('/api/config/getversionConfig');
    return UpdateModel.fromJson(res);
  }

  // type：1：用户协议 ，2：隐私
  static Future<String> getPrivacy(String type)async{
    var res = await HttpService.to.get('/api/config/getPactInfo',params: {'type':type});
    return res;
  }

}
