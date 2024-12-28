part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState implements BasePageState {
  const LoginState._();
  const factory LoginState({
    @Default(FormzStatus.pure) FormzStatus status,
    Failure? failure,
    @Default('') String email,
    @Default('') String password,
    @Default('') String errorEmailValidation,
    @Default('') String errorPasswordValidation,
  }) = _LoginState;

  @override
  Failure? get errorState => failure;

  @override
  FormzStatus get statusState => status;
}
