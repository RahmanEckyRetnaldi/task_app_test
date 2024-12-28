import 'package:auth/src/domain/usecase/usecase.dart';
import 'package:auth/src/presentation/utils/login_validator.dart';
import 'package:common_dependency/common_dependency.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState>
    with CustomSyncEmit
    implements BasePageListener<LoginState> {
  LoginCubit(
    this.loginValidator,
    this.loginUseCase,
  ) : super(const LoginState());

  final LoginValidator loginValidator;
  final LoginUseCase loginUseCase;

  void onPasswordChanged(String newValue) {
    syncEmit((state) =>
        state.copyWith(password: newValue, errorPasswordValidation: ''));
  }

  void onEmailChanged(String newValue) {
    syncEmit(
        (state) => state.copyWith(email: newValue, errorEmailValidation: ''));
  }

  Future<void> onLoginClicked(Function() onLoginSuccess) async {
    await isValidFormLogin();
    if (state.errorEmailValidation.isEmpty &&
        state.errorPasswordValidation.isEmpty) {
      syncEmit(
              (state) => state.copyWith(status: FormzStatus.submissionInProgress));
      final result =
          await loginUseCase(state.email.trim(), state.password.trim());

      result.fold(
        (l) {
          syncEmit((state) => state.copyWith(
              status: FormzStatus.submissionFailure, failure: l));
        },
        (r) {
          syncEmit(
                  (state) => state.copyWith(status: FormzStatus.submissionSuccess));
          onLoginSuccess();
        },
      );
    }
  }

  Future<void> isValidFormLogin() async {
    syncEmit(
      (state) => state.copyWith(
          errorEmailValidation: loginValidator.validateEmail(state.email),
          errorPasswordValidation:
              loginValidator.validatePassword(state.password)),
    );
  }

  @override
  clearErrorState() {
    syncEmit((state) => state.copyWith(failure: null));
  }
}
