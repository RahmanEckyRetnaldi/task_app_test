import 'dart:ui';

import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/foundation.dart';

Future<Either<Failure, ENTITY>> apiTryCatch<ENTITY>({
  required Future<Either<Failure, ENTITY>> Function() execute,
  Future<Either<Failure, ENTITY>> Function(DioServiceError e)?
      additionalErrorCondition,
}) async {
  try {
    return await execute.call();
  } on DioServiceError catch (e) {
    if (additionalErrorCondition != null) {
      try {
        return await additionalErrorCondition.call(e);
      } on DioServiceError catch (e) {
        return defaultDioServiceErrorHandler(e);
      } catch (e, stacktrace) {
        debugPrintStack(
          stackTrace: stacktrace,
          label: '${e.runtimeType} - $e',
        );
        return Left(ErrorMessageFailure(e.toString()));
      }
    }

    return defaultDioServiceErrorHandler(e);
  } catch (e, stacktrace) {
    debugPrintStack(
      stackTrace: stacktrace,
      label: '${e.runtimeType} - $e',
    );
    return Left(ErrorMessageFailure(e.toString()));
  }
}

Future<Either<Failure, ENTITY>> defaultDioServiceErrorHandler<ENTITY>(
  DioServiceError e,
) async {
  try {
    return const Left(
      ErrorMessageFailure(
        'Error Dio Service'
      ),
    );
  } on DioServiceError catch (e) {
    return Left(ErrorMessageFailure(e.message));
  }
}

String errMsgGeneral(Locale locale) {
  return locale.languageCode == "id"
      ? "Ada kesalahan, silahkan coba lagi!"
      : "Something went wrong, please try again!";
}

String errMsgConnect(Locale locale) {
  return locale.languageCode == "id"
      ? "Koneksi internet terputus, silahkan coba lagi!"
      : "Internet connection lost, please try again!";
}
