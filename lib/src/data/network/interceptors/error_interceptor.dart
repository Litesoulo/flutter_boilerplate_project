import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  ErrorInterceptor();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO Log error
    print(err);
    super.onError(err, handler);
  }
}

class ErrorEvent {
  final String path;
  final Response? response;

  ErrorEvent({required this.path, this.response});
}
