

import 'dart:io';

import 'package:common_dependency/common_dependency.dart';

class CustomLoggingInterceptor extends Interceptor {
  final Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 80,
      colors: true,
    ),
  );

  /// This method intercepts an out-going request before it reaches the
  /// destination.
  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) {
    final httpMethod = options.method.toUpperCase();
    final url = options.baseUrl + options.path;

    logger.i('Request → [$httpMethod] $url');

    logger.d({
      // 'Headers': options.headers,
      'Query Params': options.queryParameters,
      'Request Body': options.data,
    });

    return super.onRequest(options, handler);
  }

  /// This method intercepts an incoming response before it reaches Dio.
  @override
  void onResponse(
      Response response,
      ResponseInterceptorHandler handler,
      ) {
    logger.i(
      'Response ← [${response.statusCode}] ${response.requestOptions.uri}',
    );
    logger.d({
      'Response Output': response.data,
    });

    return super.onResponse(response, handler);
  }

  /// This method intercepts any exceptions thrown by Dio, or passed from a
  /// previous interceptor.
  @override
  void onError(
      DioException dioError,
      ErrorInterceptorHandler handler,
      ) {
    final httpMethod = dioError.requestOptions.method.toUpperCase();
    final url = dioError.requestOptions.baseUrl + dioError.requestOptions.path;

    logger.e('Error → [$httpMethod] $url');

    if (dioError.response != null) {
      logger.e({
        'Status Code': dioError.response!.statusCode,
        'Error Data': dioError.response!.data,
      });
    } else if (dioError.error is SocketException) {
      logger.e('No Internet Connectivity');
    } else {
      logger.e('Unknown Error');
    }

    return super.onError(dioError, handler);
  }
}