import 'package:common_dependency/common_dependency.dart';

class DioService {
  /// An instance of [Dio] for executing network requests.
  final Dio _dio;
  DioServiceError? Function(DioError)? customHandler;

  /// A public constructor that is used to create a Dio service and initialize
  /// the underlying [Dio] client.
  ///
  /// * [interceptors]: An [Iterable] for attaching custom
  /// [Interceptor]s to the underlying [_dio] client.
  /// * [httpClientAdapter]: Replaces the underlying [HttpClientAdapter] with
  /// this custom one.
  DioService({
    /// dio client instance
    required Dio dioClient,

    /// embedded interceptors to be added to dio
    Iterable<Interceptor>? interceptors,

    /// custom error handler
    this.customHandler,

    /// if true, will use AitDioTransformer which will transform error response
    /// to JSON correctly on certain condition even when the success response
    /// is not json
    bool useJsonErrorTransformer = true,
  }) : _dio = dioClient {
    if (interceptors != null) _dio.interceptors.addAll(interceptors);
    if (useJsonErrorTransformer) _dio.useJsonErrorTransformer();
  }

  /// Will execute HTTP POST request, data will be sent as JSON body by default,
  /// but you can send Multipart/form data just fine, by setting parameter
  /// isFormData to true.
  /// for example:
  /// ```dart
  /// service.post(
  ///   endpoint: '/',
  ///   data: {'file': await MultipartFile.fromFile('./text.txt', filename: 'upload.txt'),},
  ///   converter: (response) => true,
  ///   isFormData: true
  /// )
  /// ```
  Future<R> post<R>({
    required String endpoint,
    JSON? data,
    Options? options,
    CancelToken? cancelToken,
    required R Function(JSON response) converter,
    bool isFormData = false,
    JSON? queryParameters,
  }) async {
    Response<JSON> response;
    try {
      response = await _dio.post<JSON>(
        endpoint,
        data: isFormData && data != null ? FormData.fromMap(data) : data,
        options: options,
        queryParameters: queryParameters,
      );
    } catch (ex) {
      throw DioServiceError.fromDioException(ex, customHandler: customHandler);
    }
    try {
      // Returning the serialized object
      return converter(response.data!);
    } catch (ex) {
      throw DioServiceError.fromParsingException(ex);
    }
  }

  /// Will execute HTTP GET request, data will be sent as queryparams.
  /// for example:
  /// ```dart
  /// service.get(
  ///   endpoint: '/',
  ///   queryParameters: {'data': 'text', 'arr': ['1','2']},
  ///   converter: (response) => true,
  ///   isFormData: true
  /// )
  /// ```
  Future<R> get<R>({
    required String endpoint,
    JSON? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    required R Function(JSON response) converter,
  }) async {
    Response<JSON> response;
    try {
      response = await _dio.get<JSON>(
        endpoint,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (ex) {
      throw DioServiceError.fromDioException(ex, customHandler: customHandler);
    }
    try {
      // Returning the serialized object
      return converter(response.data!);
    } catch (ex) {
      throw DioServiceError.fromParsingException(ex);
    }
  }

  /// Will execute HTTP PUT request, data will be sent as JSON body by default,
  /// but you can send Multipart/form data just fine, by setting parameter
  /// isFormData to true.
  /// for example:
  /// ```dart
  /// service.put(
  ///   endpoint: '/',
  ///   data: {'file': await MultipartFile.fromFile('./text.txt', filename: 'upload.txt'),},
  ///   converter: (response) => true,
  ///   isFormData: true
  /// )
  /// ```
  Future<R> put<R>({
    required String endpoint,
    JSON? data,
    Options? options,
    CancelToken? cancelToken,
    required R Function(JSON response) converter,
    bool isFormData = false,
    JSON? queryParameters,
  }) async {
    Response<JSON> response;
    try {
      response = await _dio.put<JSON>(
        endpoint,
        data: isFormData && data != null ? FormData.fromMap(data) : data,
        options: options,
        queryParameters: queryParameters,
      );
    } catch (ex) {
      throw DioServiceError.fromDioException(ex, customHandler: customHandler);
    }
    try {
      // Returning the serialized object
      return converter(response.data!);
    } catch (ex) {
      throw DioServiceError.fromParsingException(ex);
    }
  }

  /// Will execute HTTP PATCH request, data will be sent as JSON body by default,
  /// but you can send Multipart/form data just fine, by setting parameter
  /// isFormData to true.
  /// for example:
  /// ```dart
  /// service.put(
  ///   endpoint: '/',
  ///   data: {'file': await MultipartFile.fromFile('./text.txt', filename: 'upload.txt'),},
  ///   converter: (response) => true,
  ///   isFormData: true
  /// )
  /// ```
  Future<R> patch<R>({
    required String endpoint,
    JSON? data,
    Options? options,
    CancelToken? cancelToken,
    required R Function(JSON response) converter,
    bool isFormData = false,
    JSON? queryParameters,
  }) async {
    Response<JSON> response;
    try {
      response = await _dio.patch<JSON>(
        endpoint,
        data: isFormData && data != null ? FormData.fromMap(data) : data,
        options: options,
        queryParameters: queryParameters,
      );
    } catch (ex) {
      throw DioServiceError.fromDioException(ex, customHandler: customHandler);
    }
    try {
      // Returning the serialized object
      return converter(response.data!);
    } catch (ex) {
      throw DioServiceError.fromParsingException(ex);
    }
  }

  /// Will execute HTTP GET request, data will be sent as queryParams.
  /// for example:
  /// ```dart
  /// service.delete(
  ///   endpoint: '/',
  ///   data: {'data': 'text', 'arr': ['1','2']},
  ///   converter: (response) => true,
  ///   isFormData: true
  /// )
  /// ```
  Future<R> delete<R>({
    required String endpoint,
    JSON? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    required R Function(JSON response) converter,
  }) async {
    Response<JSON> response;
    try {
      response = await _dio.delete<JSON>(
        endpoint,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (ex) {
      throw DioServiceError.fromDioException(ex, customHandler: customHandler);
    }
    try {
      // Returning the serialized object
      final data = response.data == null ? {"data": ""} : response.data!;
      return converter(data);
    } catch (ex) {
      throw DioServiceError.fromParsingException(ex);
    }
  }
}
