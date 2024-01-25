///常量配置
class Constants{
  // 服务 api
  static const apiUrl = 'https://server-admin.zclm.vip';
  static const gameUrl = 'https://server-h5.zclm.vip?company-code=$companyCode';
  // 请求头 必填的参数
  static const companyCode = 31;

  // 本地存储key
  static const storageLanguageCode = 'language_code'; // 本地存储key
  static const storageThemeCode = 'theme_code'; // Theme 主题
  static const storageFirstOpen = 'first_open'; // 首次打开
  static const storageToken = 'token'; // 登录成功后 token
  static const storageUserInfo = 'user_info'; // 用户资料缓存

}