import 'package:common_dependency/common_dependency.dart';

/// Will transform error response to JSON when response content type is JSON.
class JsonErrorDioTransformer extends BackgroundTransformer {
  @override
  Future transformResponse(RequestOptions options, ResponseBody response) {
    if (!options.validateStatus(response.statusCode) &&
        options.responseType != ResponseType.json &&
        Transformer.isJsonMimeType(
          response.headers[Headers.contentTypeHeader]?.first,
        )) {
      return super.transformResponse(
          options.copyWith(responseType: ResponseType.json), response);
    }
    return super.transformResponse(options, response);
  }
}

extension JsonErrorDioExt on Dio {
  Dio useJsonErrorTransformer() =>
      this..transformer = JsonErrorDioTransformer();
}
