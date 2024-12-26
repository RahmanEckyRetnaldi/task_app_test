import 'package:common_dependency/common_dependency.dart';

import '../entity/entity.dart';

abstract class AuthRepository{
  Future<Either<Failure, String>> login(LoginEntity body);
}