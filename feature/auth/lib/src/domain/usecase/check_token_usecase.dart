
import 'package:auth/auth.dart';

class CheckLoginUseCase {
  final AuthRepository repository;

  CheckLoginUseCase(this.repository);

  Future<bool> call() async {
    return await repository.isLoggedIn();
  }
}