import 'package:auth/auth.dart';
import 'package:common_dependency/common_dependency.dart';

import '../datasource/auth_local_ds.dart';
import '../datasource/auth_remote_ds.dart';
import '../model/request/login_request_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource source;
  final AuthLocalDataSource localDataSource;
  AuthRepositoryImpl(this.source, this.localDataSource);

  @override
  Future<Either<Failure, String>> login(LoginEntity body) async {
    return apiTryCatch(execute: () async {
      final result = await source.login(LoginRequestModel.fromEntity(body));
      try{
        if(result.accessToken == null){
          return const Left(ErrorMessageFailure("Login failed"));
        }
        // set new token
        final user =  UserModel(token: result.accessToken.orEmpty());
        await localDataSource.saveUser(user);
        return Right(result.accessToken ?? '');
      }catch(e){
        return const Left(ErrorMessageFailure("Login failed"));
      }
    });
  }

  @override
  Future<bool> isLoggedIn()async {
    final user = await localDataSource.getUser();
    return user != null && user.token.isNotEmpty;

  }

  @override
  Future<void> logout() async {
    await localDataSource.deleteUser();
  }
}
