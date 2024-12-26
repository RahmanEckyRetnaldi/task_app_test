import 'package:auth/src/data/datasource/endpoint/auth_endpoint.dart';
import 'package:auth/src/data/model/login_response_model.dart';
import 'package:auth/src/data/model/request/login_request_model.dart';
import 'package:common_dependency/common_dependency.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login(LoginRequestModel body);
}


class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioService service;

  AuthRemoteDataSourceImpl(this.service);

  @override
  Future<LoginResponseModel> login(LoginRequestModel body) async {
    return await service.post(
      endpoint: AuthEnpoint.login,
      data: body.toJson(),
      converter: (respone){
        return LoginResponseModel.fromJson(respone);
      },
    );
  }

}