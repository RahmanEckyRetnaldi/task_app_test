

import 'package:common_dependency/common_dependency.dart';
import 'package:network/src/custom_interceptor.dart';

import 'api/api_module.dart';
import 'api/dio_services.dart';

class NetworkModule {
  final ApiModule _apiModule = ApiModule();

  Future<void> call({
    required String baseUrl,
    required final rootNavigatorKey,
  }) async {
    const Duration timeout = Duration(seconds: 60);
    await _apiModule(
      di,
      dio: (_) => Dio(
        BaseOptions(
          baseUrl: baseUrl,
          contentType: 'application/json',
          connectTimeout: timeout,
          sendTimeout: timeout,
          receiveTimeout: timeout,
        ),
      ),
      dioService: (di) => DioService(
        dioClient: di(),
        interceptors: [
          CustomLoggingInterceptor(),
        ],
      ),
    );
  }
}