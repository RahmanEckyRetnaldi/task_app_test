

import 'package:auth/src/domain/entity/entity.dart';
import 'package:common_dependency/common_dependency.dart';

part 'login_request_model.freezed.dart';
part 'login_request_model.g.dart';

@freezed
class LoginRequestModel with _$LoginRequestModel {
  const LoginRequestModel._();

  const factory LoginRequestModel({
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'password') String? password,
  }) = _LoginModel;

  factory LoginRequestModel.fromEntity(LoginEntity entity) =>
      LoginRequestModel(email: entity.email, password: entity.password);

  LoginEntity toEntity() =>
      LoginEntity(email:email ?? '', password: password ?? '');

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);
}