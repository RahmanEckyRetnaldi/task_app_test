import 'package:auth/auth.dart';
import 'package:auth/src/data/datasource/auth_remote_ds.dart';
import 'package:auth/src/data/repositoryimpl/auth_repository_impl.dart';
import 'package:auth/src/domain/usecase/login_usecase.dart';
import 'package:auth/src/presentation/pages/login/cubit/login_cubit.dart';
import 'package:auth/src/presentation/utils/login_validator.dart';
import 'package:common_dependency/common_dependency.dart';

class AuthModule{
  Future<void> call()async{
    //data source
    di.registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl(di()));

    //repository
    di.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(di()));

    //usecase
    di.registerLazySingleton(() => LoginUseCase(di()));

    // Cubit
    di.registerFactory<LoginCubit>(() => LoginCubit(di(), di()));

    //login validator
    di.registerLazySingleton<LoginValidator>(() => const LoginValidator());
  }
}