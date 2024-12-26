import 'package:auth/auth.dart';
import 'package:auth/src/domain/entity/login_entity.dart';
import 'package:common_dependency/common_dependency.dart';

import '../datasource/auth_remote_ds.dart';
import '../model/request/login_request_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource source;
  AuthRepositoryImpl(this.source);

  @override
  Future<Either<Failure, String>> login(LoginEntity body) async {
    return apiTryCatch(execute: () async {
      final result = await source.login(LoginRequestModel.fromEntity(body));
      try{
        if(result.accessToken == null){
          return const Left(ErrorMessageFailure("Login failed"));
        }
        // set new token
        // await localData.setTokens(
        //   whichToken: WhichToken.user,
        //   token: loginResponse,
        // );
        return Right(result.accessToken ?? '');
      }catch(e){
        return const Left(ErrorMessageFailure("Login failed"));
      }
    });
  }
}
