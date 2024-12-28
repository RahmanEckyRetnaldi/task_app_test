
import 'package:auth/auth.dart';

class LogoutUseCase {
  final AuthRepository repository;
  LogoutUseCase(this.repository);
  Future<bool> call() async {
    await repository.logout();
    final checkLogin = await repository.isLoggedIn();
    return !checkLogin;
  }
}