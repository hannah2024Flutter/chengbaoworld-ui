import 'dart:io';

import 'package:castleworld/common/routers/app_routes.dart';
import 'package:castleworld/common/services/user_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../config/constants.dart';
import '../model/api_resp.dart';
import '../model/error_message_model.dart';
import '../util/loading.dart';

class HttpService extends GetxService {
  static HttpService get to => Get.find();

  late final Dio _dio;

  // final CancelToken _cancelToken = CancelToken(); // 默认去掉

  @override
  void onInit() {
    super.onInit();

    // 初始 dio
    var options = BaseOptions(
      baseUrl: Constants.apiUrl,
      connectTimeout: const Duration(seconds: 10),
      // 10秒
      receiveTimeout: const Duration(seconds: 5),
      // 5秒
      headers: {'company-code': Constants.companyCode},
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );
    _dio = Dio(options);

    // 拦截器
    _dio.interceptors.add(RequestInterceptors());
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    ));
  }

  Future get(
    String url, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    Response response = await _dio.get(
      url,
      queryParameters: params,
      options: requestOptions,
      cancelToken: cancelToken,
    );

    var resp = ApiResp.fromJson(response.data!);
    if (resp.code == 200) {
      return resp.data;
    } else {
      return Loading.error(resp.msg);
    }
  }

  Future post(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var requestOptions = options ?? Options();
    Response response = await _dio.post(
      url,
      data: data ?? {},
      options: requestOptions,
      cancelToken: cancelToken,
    );
    var resp = ApiResp.fromJson(response.data);
    if (resp.code == 200) {
      return resp.data;
    } else {
      Loading.error(resp.msg);
      return Future.error(resp.msg);
    }
  }

  Future put(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var requestOptions = options ?? Options();
    Response response = await _dio.put(
      url,
      data: data ?? {},
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }

  Future delete(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var requestOptions = options ?? Options();
    Response response = await _dio.delete(
      url,
      data: data ?? {},
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }
}

/// 拦截
class RequestInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // super.onRequest(options, handler);

    // options.headers['company-code'] = Constants.companyCode;
    // http header 头加入 Authorization
    if (UserService.to.hasToken) {
      options.headers['token'] = UserService.to.token;
    }

    return handler.next(options);
    // 如果你想完成请求并返回一些自定义数据，你可以resolve一个Response对象 `handler.resolve(response)`。
    // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
    //
    // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象,如`handler.reject(error)`，
    // 这样请求将被中止并触发异常，上层catchError会被调用。
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // 200 请求成功, 201 添加成功
    if (response.statusCode != 200 && response.statusCode != 201) {

      handler.reject(
        DioException(
            requestOptions: response.requestOptions,
            response: response,
            type: DioExceptionType.badResponse),
        // DioError(
        //   requestOptions: response.requestOptions,
        //   response: response,
        //   type: DioErrorType.response,
        // ),
        true,
      );
    } else {
      handler.next(response);
    }
  }

  // 退出并重新登录
  Future<void> _errorNoAuthLogout() async {
    await UserService.to.logout();
    Get.toNamed(AppRoutes.main);
  }

  // 如果 401 错误直接去登录页
  // 打印错误信息给用户 Loading.error(errorMessage.message);
  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    final exception = HttpException(err.message ?? "error message");
    switch (err.type) {
      case DioExceptionType.badResponse: // 服务端自定义错误体处理
        {
          final response = err.response;
          final errorMessage = ErrorMessageModel.fromJson(response?.data);
          switch (errorMessage.statusCode) {
            case 401: // 401 未登录
              _errorNoAuthLogout(); // 注销 并跳转到登录页面
              break;
            case 404:
              break;
            case 500:
              break;
            case 502:
              break;
            case 1001:
              break;
            default:
              break;
          }
          Loading.error(errorMessage.message);
        }
        break;
      case DioExceptionType.unknown:
        {
          final response = err.response;
          final errorMessage = ErrorMessageModel.fromJson(response?.data);
          Loading.error(errorMessage.message);
        }
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.connectionTimeout:
        break;
      default:
        break;
    }
    DioException errNext = err.copyWith(error: exception);
    // err.error = exception;
    handler.next(errNext);
  }
}
