import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //ToDo add the header of your choice
    options.headers['token'] = '';
    super.onRequest(options, handler);
  }
}
