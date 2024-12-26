
import 'package:common_dependency/common_dependency.dart';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

@freezed
class LoginResponseModel with _$LoginResponseModel {
  const LoginResponseModel._();

  const factory LoginResponseModel ({
    @JsonKey(name: 'token') String? accessToken
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
    _$LoginResponseModelFromJson(json);
}