import 'package:auth/auth.dart';
import 'package:common_dependency/common_dependency.dart';

import '../entity/entity.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, String>> call(
    String email,
    String password,
  ) async {
    final service = await repository.login(
      LoginEntity(
        email: email,
        password: password,
      ),
    );
    return service.fold((l) => Left(l), (r) => Right(r));
  }
}
